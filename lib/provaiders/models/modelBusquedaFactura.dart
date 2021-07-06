// To parse this JSON data, do
//
//     final busquedaFacturas = busquedaFacturasFromJson(jsonString);

import 'dart:convert';

BusquedaFacturas ParsebusquedaFacturas(String respomseBody) =>
    BusquedaFacturas.fromJson(json.decode(respomseBody));

String busquedaFacturasToJson(BusquedaFacturas data) =>
    json.encode(data.toJson());

class BusquedaFacturas {
  BusquedaFacturas({
    required this.success,
    required this.data,
  });

  bool success;
  List<InfoBusquedaFacturas> data;

  factory BusquedaFacturas.fromJson(Map<String, dynamic> json) =>
      BusquedaFacturas(
        success: json["success"],
        data: List<InfoBusquedaFacturas>.from(
            json["data"].map((x) => InfoBusquedaFacturas.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class InfoBusquedaFacturas {
  InfoBusquedaFacturas({
    required this.idFactura,
    required this.vendedor,
    required this.idCliente,
    required this.cliente,
    required this.limiteCredito,
    required this.plazoPago,
    required this.estado,
    required this.credito,
    required this.createdAt,
    required this.total,
    required this.tipoCompra,
  });

  int idFactura;
  String vendedor;
  int idCliente;
  String cliente;
  int limiteCredito;
  int plazoPago;
  String estado;
  int credito;
  CreatedAt createdAt;
  String total;
  String tipoCompra;

  factory InfoBusquedaFacturas.fromJson(Map<String, dynamic> json) =>
      InfoBusquedaFacturas(
        idFactura: json["idFactura"],
        vendedor: json["Vendedor"],
        idCliente: json["idCliente"],
        cliente: json["Cliente"],
        limiteCredito: json["LimiteCredito"],
        plazoPago: json["PlazoPago"],
        estado: json["Estado"],
        credito: json["Credito"],
        createdAt: CreatedAt.fromJson(json["created_at"]),
        total: json["Total"],
        tipoCompra: json["TipoCompra"],
      );

  Map<String, dynamic> toJson() => {
        "idFactura": idFactura,
        "Vendedor": vendedor,
        "idCliente": idCliente,
        "Cliente": cliente,
        "LimiteCredito": limiteCredito,
        "PlazoPago": plazoPago,
        "Estado": estado,
        "Credito": credito,
        "created_at": createdAt.toJson(),
        "Total": total,
        "TipoCompra": tipoCompra,
      };
}

class CreatedAt {
  CreatedAt({
    required this.date,
    required this.timezoneType,
    required this.timezone,
  });

  DateTime date;
  int timezoneType;
  String timezone;

  factory CreatedAt.fromJson(Map<String, dynamic> json) => CreatedAt(
        date: DateTime.parse(json["date"]),
        timezoneType: json["timezone_type"],
        timezone: json["timezone"],
      );

  Map<String, dynamic> toJson() => {
        "date": date.toIso8601String(),
        "timezone_type": timezoneType,
        "timezone": timezone,
      };
}
