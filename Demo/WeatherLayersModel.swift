//
//  WeatherLayersModel.swift
//  Demo
//
//  Created by Slipp Douglas Thompson on 2/12/24.
//

import Combine
import MapsGLMaps



/// View-model for weather layers, bridging MapsGL's ``WeatherService`` model to Demo app's ``RepresentedMapboxMapView`` view, and ownership of view seleected layer state.
class WeatherLayersModel : ObservableObject
{
	@Published var selectedLayerCodes: Set<WeatherService.LayerCode>
	
	init(selectedLayerCodes: Set<WeatherService.LayerCode> = []) {
		self.selectedLayerCodes = selectedLayerCodes
	}
}


// MARK: Constant Layer Configurations

extension WeatherLayersModel
{
	static let allLayers: [Layer] = [
		.init(
			code: .temperatures,
			title: "Temperatures", 
			category: .conditions,
			makeConfiguration: { WeatherService.Temperatures(service: $0) }
		),
		.init(
			code: .temperatures24HourChange,
			title: "24hr Temp Change",
			category: .conditions,
			makeConfiguration: { WeatherService.Temperatures24HourChange(service: $0) }
		),
		.init(
			code: .temperatures1HourChange,
			title: "1hr Temp Change", 
			category: .conditions,
			makeConfiguration: { WeatherService.Temperatures1HourChange(service: $0) }
		),
		.init(
			code: .windSpeeds,
			title: "Winds", 
			category: .conditions,
			makeConfiguration: { WeatherService.WindSpeeds(service: $0) }
		),
		.init(
			code: .feelsLike,
			title: "Feels Like", 
			category: .conditions,
			makeConfiguration: { WeatherService.FeelsLike(service: $0) }
		),
		.init(
			code: .heatIndex,
			title: "Heat Index", 
			category: .conditions,
			makeConfiguration: { WeatherService.HeatIndex(service: $0) }
		),
		.init(
			code: .windChill,
			title: "Wind Chill", 
			category: .conditions,
			makeConfiguration: { WeatherService.WindChill(service: $0) }
		),
		.init(
			code: .dewPoint,
			title: "Dew Point", 
			category: .conditions,
			makeConfiguration: { WeatherService.DewPoint(service: $0) }
		),
		.init(
			code: .humidity,
			title: "Humidity", 
			category: .conditions,
			makeConfiguration: { WeatherService.Humidity(service: $0) }
		),
		.init(
			code: .pressureMeanSeaLevel,
			title: "MSLP",
			category: .conditions,
			makeConfiguration: { WeatherService.PressureMeanSeaLevel(service: $0) }
		),
		.init(
			code: .visibility,
			title: "Visibility", 
			category: .conditions,
			makeConfiguration: { WeatherService.Visibility(service: $0) }
		),
		.init(
			code: .uvIndex,
			title: "UV Index", 
			category: .conditions,
			makeConfiguration: { WeatherService.UVIndex(service: $0) }
		),
		.init(
			code: .cloudCover,
			title: "Cloud Cover", 
			category: .conditions,
			makeConfiguration: { WeatherService.CloudCover(service: $0) }
		),
		.init(
			code: .precipitation,
			title: "Precip Accum", 
			category: .conditions,
			makeConfiguration: { WeatherService.Precipitation(service: $0) }
		),
		.init(
			code: .precipitationRate,
			title: "Precip Rate", 
			category: .conditions,
			makeConfiguration: { WeatherService.PrecipitationRate(service: $0) }
		),
		.init(
			code: .radar,
			title: "Radar", 
			category: .conditions,
			makeConfiguration: { WeatherService.Radar(service: $0) }
		),
		.init(
			code: .airQualityIndex,
			title: "AQI", 
			category: .airQuality,
			makeConfiguration: { WeatherService.AirQualityIndex(service: $0) }
		),
		.init(
			code: .airQualityIndexCategories,
			title: "AQI Categories",
			category: .airQuality,
			makeConfiguration: { WeatherService.AirQualityIndexCategories(service: $0) }
		),
		.init(
			code: .particulateMatter2_5Micron,
			title: "Particulate Pollution (PM2.5)",
			category: .airQuality,
			makeConfiguration: { WeatherService.ParticulateMatter2_5Micron(service: $0) }
		),
		.init(
			code: .particulateMatter10Micron,
			title: "Particulate Pollution (PM10)",
			category: .airQuality,
			makeConfiguration: { WeatherService.ParticulateMatter10Micron(service: $0) }
		),
		.init(
			code: .carbonMonoxide,
			title: "Carbon Monoxide (CO)", 
			category: .airQuality,
			makeConfiguration: { WeatherService.CarbonMonoxide(service: $0) }
		),
		.init(
			code: .nitricOxide,
			title: "Nitric Oxide (NO)", 
			category: .airQuality,
			makeConfiguration: { WeatherService.NitricOxide(service: $0) }
		),
		.init(
			code: .nitrogenDioxide,
			title: "Nitrogen Dioxide (NO2)", 
			category: .airQuality,
			makeConfiguration: { WeatherService.NitrogenDioxide(service: $0) }
		),
		.init(
			code: .ozone,
			title: "Ozone (O3)", 
			category: .airQuality,
			makeConfiguration: { WeatherService.Ozone(service: $0) }
		),
		.init(
			code: .sulfurDioxide,
			title: "Sulfur Dioxide (SO2)", 
			category: .airQuality,
			makeConfiguration: { WeatherService.SulfurDioxide(service: $0) }
		),
		.init(
			code: .seaSurfaceTemperatures,
			title: "Sea Surface Temps", 
			category: .maritime,
			makeConfiguration: { WeatherService.SeaSurfaceTemperatures(service: $0) }
		),
		.init(
			code: .oceanCurrents,
			title: "Currents", 
			category: .maritime,
			makeConfiguration: { WeatherService.OceanCurrents(service: $0) }
		),
		.init(
			code: .waveHeights,
			title: "Wave Heights", 
			category: .maritime,
			makeConfiguration: { WeatherService.WaveHeights(service: $0) }
		),
		.init(
			code: .wavePeriods,
			title: "Wave Periods", 
			category: .maritime,
			makeConfiguration: { WeatherService.WavePeriods(service: $0) }
		),
		.init(
			code: .swellHeights,
			title: "Swell Heights", 
			category: .maritime,
			makeConfiguration: { WeatherService.SwellHeights(service: $0) }
		),
		.init(
			code: .swellPeriods,
			title: "Swell Periods", 
			category: .maritime,
			makeConfiguration: { WeatherService.SwellPeriods(service: $0) }
		),
		.init(
			code: .swell2Heights,
			title: "Swell 2 Heights", 
			category: .maritime,
			makeConfiguration: { WeatherService.Swell2Heights(service: $0) }
		),
		.init(
			code: .swell2Periods,
			title: "Swell 2 Periods", 
			category: .maritime,
			makeConfiguration: { WeatherService.Swell2Periods(service: $0) }
		),
		.init(
			code: .swell3Heights,
			title: "Swell 3 Heights", 
			category: .maritime,
			makeConfiguration: { WeatherService.Swell3Heights(service: $0) }
		),
		.init(
			code: .swell3Periods,
			title: "Swell 3 Periods", 
			category: .maritime,
			makeConfiguration: { WeatherService.Swell3Periods(service: $0) }
		),
		.init(
			code: .stormSurge,
			title: "Storm Surge", 
			category: .maritime,
			makeConfiguration: { WeatherService.StormSurge(service: $0) }
		),
		.init(
			code: .tideHeights,
			title: "Tide Heights", 
			category: .maritime,
			makeConfiguration: { WeatherService.TideHeights(service: $0) }
		),
	]
	
	static let allLayersByCode: [WeatherService.LayerCode : Layer] = Dictionary(uniqueKeysWithValues: allLayers.map { layer in
		( key: layer.code, value: layer )
	})
	
	static let allLayersByCategory: [Category : [Layer]] = Dictionary(uniqueKeysWithValues: Category.allCases.map { category in
		( key: category, value: allLayers.filter { $0.category == category } )
	})
	
	enum Category : CaseIterable, Identifiable
	{
		case conditions
		case airQuality
		case maritime
		
		var id: Self { self }
		
		var title: String {
			switch self {
				case .conditions: "Conditions"
				case .airQuality: "Air Quality"
				case .maritime: "Maritime"
			}
		}
	}
	
	struct Layer : Identifiable
	{
		let code: WeatherService.LayerCode
		var id: WeatherService.LayerCode { self.code }
		let title: String
		let category: Category
		let makeConfiguration: (_ service: WeatherService) -> any WeatherLayerConfiguration
	}
}
