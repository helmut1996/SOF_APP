// To parse this JSON data, do
//
//     final facturaCosmetico = facturaCosmeticoFromJson(jsonString);

import 'dart:convert';
import 'dart:developer';

FacturaCosmetico ParseFacturaCosmetico(String responseBody) =>
    FacturaCosmetico.fromJson(json.decode(responseBody));

String facturaCosmeticoToJson(FacturaCosmetico data) =>
    json.encode(data.toJson());

class FacturaCosmetico {
  FacturaCosmetico({
    required this.success,
    required this.facturas,
  });

  bool success;
  List<Factura> facturas;

  factory FacturaCosmetico.fromJson(Map<String, dynamic> json) =>
      FacturaCosmetico(
        success: json["success"],
        facturas: List<Factura>.from(
            json["facturas"].map((x) => Factura.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "facturas": List<dynamic>.from(facturas.map((x) => x.toJson())),
      };
}

class Factura {
  Factura({
    required this.rowNumber,
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

  String rowNumber;
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

  factory Factura.fromJson(Map<String, dynamic> json) => Factura(
        rowNumber: json["rowNumber"],
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
        "rowNumber": rowNumber,
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
