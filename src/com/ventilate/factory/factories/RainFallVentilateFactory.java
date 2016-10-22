package com.ventilate.factory.factories;

import com.ventilate.factory.iVentilate.Provider;
import com.ventilate.factory.iVentilate.Ventilate;
import com.ventilate.factory.ventilateImpl.RainFallVentilate;

public class RainFallVentilateFactory implements Provider {
	@Override
	public Ventilate createVentilate() {
		return new RainFallVentilate();
	}
}
