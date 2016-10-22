package com.common.serialPortUtil;
/* @(#)SerialConnection.java	1.6 98/07/17 SMI
 *
 * Copyright (c) 1998 Sun Microsystems, Inc. All Rights Reserved.
 *
 * Sun grants you ("Licensee") a non-exclusive, royalty free, license
 * to use, modify and redistribute this software in source and binary
 * code form, provided that i) this copyright notice and license appear
 * on all copies of the software; and ii) Licensee does not utilize the
 * software in a manner which is disparaging to Sun.
 *
 * This software is provided "AS IS," without a warranty of any kind.
 * ALL EXPRESS OR IMPLIED CONDITIONS, REPRESENTATIONS AND WARRANTIES,
 * INCLUDING ANY IMPLIED WARRANTY OF MERCHANTABILITY, FITNESS FOR A
 * PARTICULAR PURPOSE OR NON-INFRINGEMENT, ARE HEREBY EXCLUDED. SUN AND
 * ITS LICENSORS SHALL NOT BE LIABLE FOR ANY DAMAGES SUFFERED BY
 * LICENSEE AS A RESULT OF USING, MODIFYING OR DISTRIBUTING THE
 * SOFTWARE OR ITS DERIVATIVES. IN NO EVENT WILL SUN OR ITS LICENSORS
 * BE LIABLE FOR ANY LOST REVENUE, PROFIT OR DATA, OR FOR DIRECT,
 * INDIRECT, SPECIAL, CONSEQUENTIAL, INCIDENTAL OR PUNITIVE DAMAGES,
 * HOWEVER CAUSED AND REGARDLESS OF THE THEORY OF LIABILITY, ARISING
 * OUT OF THE USE OF OR INABILITY TO USE SOFTWARE, EVEN IF SUN HAS BEEN
 * ADVISED OF THE POSSIBILITY OF SUCH DAMAGES.
 *
 * This software is not designed or intended for use in on-line control
 * of aircraft, air traffic, aircraft navigation or aircraft
 * communications; or in the design, construction, operation or
 * maintenance of any nuclear facility. Licensee represents and
 * warrants that it will not use or redistribute the Software for such
 * purposes.
 */
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.TooManyListenersException;
import javax.comm.CommPortIdentifier;
import javax.comm.CommPortOwnershipListener;
import javax.comm.NoSuchPortException;
import javax.comm.PortInUseException;
import javax.comm.SerialPort;
import javax.comm.SerialPortEvent;
import javax.comm.SerialPortEventListener;
import javax.comm.UnsupportedCommOperationException;
import org.springframework.ui.ModelMap;
import com.common.utils.CHexConverUtil;
import com.common.utils.CRCCheckUtil;
import com.common.utils.MathUtil;
import com.common.utils.RequestUtil;
import com.common.utils.StringUtils;
import com.hibernate.baseSettingInfo.domain.BaseSettingBean;
import com.hibernate.sernsorInfo.domain.SensorDataBean;
import com.spring.ServiceManager;
/**
 * A class that handles the details of a serial connection. Reads from one
 * TextArea and writes to a second TextArea. Holds the state of the connection.
 */
public class SerialConnection implements SerialPortEventListener,
		CommPortOwnershipListener {
	private SerialParameters parameters;
	private OutputStream os;
	private InputStream is;
	private CommPortIdentifier portId;
	private SerialPort sPort;
	private boolean open;
	// 请求寄存器的地址
	private boolean isCachAddressRequest = true;
	// 主机地址
	private int serviceArrress = 60;
	// 读命令
	private int cmd_read = 03;
	// 写命令
	private int cmd_write = 10;
	
	private CallBackFun callBackFun;
	public SerialConnection(SerialParameters parameters,CallBackFun callBackFun) {
		this.parameters = parameters;
		open = false;
		this.callBackFun = callBackFun;
	}
	public void openConnection() throws SerialConnectionException {
		// Obtain a CommPortIdentifier object for the port you want to open.
		try {
			portId = CommPortIdentifier.getPortIdentifier(parameters
					.getPortName());
		} catch (NoSuchPortException e) {
			throw new SerialConnectionException(e.getMessage());
		}
		try {
			sPort = (SerialPort) portId.open("lqt", 3);
		} catch (PortInUseException e) {
			throw new SerialConnectionException(e.getMessage());
		}
		try {
			setConnectionParameters();
		} catch (SerialConnectionException e) {
			sPort.close();
			throw e;
		}
		try {
			os = sPort.getOutputStream();
			is = sPort.getInputStream();
		} catch (IOException e) {
			sPort.close();
			throw new SerialConnectionException("Error opening i/o streams");
		}
		try {
			sPort.addEventListener(this);
		} catch (TooManyListenersException e) {
			sPort.close();
			throw new SerialConnectionException("too many listeners added");
		}
		// Set notifyOnDataAvailable to true to allow event driven input.
		sPort.notifyOnDataAvailable(true);
		// Set notifyOnBreakInterrup to allow event driven break handling.
		sPort.notifyOnBreakInterrupt(true);
		// Set receive timeout to allow breaking out of polling loop during
		// input handling.
		try {
			sPort.enableReceiveTimeout(3000);
		} catch (UnsupportedCommOperationException e) {
			e.printStackTrace();
		}
		// Add ownership listener to allow ownership event handling.
		portId.addPortOwnershipListener(this);
		open = true;
	}
	/**
	 * Sets the connection parameters to the setting in the parameters object.
	 * If set fails return the parameters object to origional settings and throw
	 * exception.
	 */
	public void setConnectionParameters() throws SerialConnectionException {
		// Save state of parameters before trying a set.
		int oldBaudRate = sPort.getBaudRate();
		int oldDatabits = sPort.getDataBits();
		int oldStopbits = sPort.getStopBits();
		int oldParity = sPort.getParity();
		int oldFlowControl = sPort.getFlowControlMode();
		// Set connection parameters, if set fails return parameters object
		// to original state.
		try {
			sPort.setSerialPortParams(parameters.getBaudRate(),
					parameters.getDatabits(), parameters.getStopbits(),
					parameters.getParity());
		} catch (UnsupportedCommOperationException e) {
			parameters.setBaudRate(oldBaudRate);
			parameters.setDatabits(oldDatabits);
			parameters.setStopbits(oldStopbits);
			parameters.setParity(oldParity);
			throw new SerialConnectionException("Unsupported parameter");
		}
		// Set flow control.
		try {
			sPort.setFlowControlMode(parameters.getFlowControlIn()
					| parameters.getFlowControlOut());
		} catch (UnsupportedCommOperationException e) {
			throw new SerialConnectionException("Unsupported flow control");
		}
	}
	/**
	 * Close the port and clean up associated elements.
	 */
	public void closeConnection() {
		if (!open) {
			return;
		}
		if (sPort != null) {
			try {
				os.close();
				is.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
			sPort.close();
			portId.removePortOwnershipListener(this);
		}
		open = false;
	}
	/**
	 * Send a one second break signal.
	 */
	public void sendBreak() {
		sPort.sendBreak(1000);
	}
	public boolean isOpen() {
		return open;
	}
	public void serialEvent(SerialPortEvent e) {
		List<String> dataList = new ArrayList<String>();
		StringBuffer inputBuffer = new StringBuffer();
		int newData = 0;
		switch (e.getEventType()) {
		case SerialPortEvent.DATA_AVAILABLE:
			while (newData != -1) {
				try {
					newData = is.read();
					if (newData == -1) {
						break;
					}
					if ('\r' == (char) newData) {
						inputBuffer.append('\n');
					} else {
						String binaryStr = Integer.toHexString(newData);
						if (binaryStr.length() < 2) {
							binaryStr = "0" + binaryStr;
						}
						dataList.add(binaryStr);
						inputBuffer.append(binaryStr);
						inputBuffer.append("#");
					}
				} catch (IOException ex) {
					System.err.println(ex);
					return;
				}
			}
			if(null != callBackFun){
				callBackFun.execute(dataList);
			}
			//operateData(inputBuffer.toString());
			break;
		case SerialPortEvent.BI:
		}
	}
	
	/**
	 * 写命令处理逻辑
	 */
	public void writeData(int[] c) {
		try {
			byte[] b = new byte[c.length];
			for (int i = 0; i < c.length; i++) {
				b[i] = (byte)c[i];
			}
			os.write(b);
			os.flush();
		} catch (IOException e) {
			System.err.println("OutputStream write error: " + e);
		}
	}
	/**
	 * Handles ownership events. If a PORT_OWNERSHIP_REQUESTED event is received
	 * a dialog box is created asking the user if they are willing to give up
	 * the port. No action is taken on other types of ownership events.
	 */
	public void ownershipChange(int type) {
		if (type == CommPortOwnershipListener.PORT_OWNERSHIP_REQUESTED) {
			// PortRequestedDialog prd = new PortRequestedDialog(parent);
		}
	}

}
