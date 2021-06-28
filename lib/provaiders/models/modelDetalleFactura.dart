// To parse this JSON data, do
//
//     final detalleFacturaCosmeticos = detalleFacturaCosmeticosFromJson(jsonString);

import 'dart:convert';

DetalleFacturaCosmeticos ParsedetalleFacturaCosmeticos(String responseBody) =>
    DetalleFacturaCosmeticos.fromJson(json.decode(responseBody));

String ParsedetalleFacturaCosmeticosToJson(DetalleFacturaCosmeticos data) =>
    json.encode(data.toJson());

class DetalleFacturaCosmeticos {
  DetalleFacturaCosmeticos({
    required this.infoFactura,
    required this.detalleFactura,
  });

  List<InfoFactura> infoFactura;
  List<DetalleFactura> detalleFactura;

  factory DetalleFacturaCosmeticos.fromJson(Map<String, dynamic> json) =>
      DetalleFacturaCosmeticos(
        infoFactura: List<InfoFactura>.from(
            json["InfoFactura"].map((x) => InfoFactura.fromJson(x))),
        detalleFactura: List<DetalleFactura>.from(
            json["DetalleFactura"].map((x) => DetalleFactura.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "InfoFactura": List<dynamic>.from(infoFactura.map((x) => x.toJson())),
        "DetalleFactura":
            List<dynamic>.from(detalleFactura.map((x) => x.toJson())),
      };
}

class DetalleFactura {
  DetalleFactura({
    required this.producto,
    required this.cantidad,
    required this.precio,
  });

  String producto;
  int cantidad;
  int precio;

  factory DetalleFactura.fromJson(Map<String, dynamic> json) => DetalleFactura(
        producto: json["Producto"],
        cantidad: json["Cantidad"],
        precio: json["Precio"],
      );

  Map<String, dynamic> toJson() => {
        "Producto": producto,
        "Cantidad": cantidad,
        "Precio": precio,
      };
}

class InfoFactura {
  InfoFactura({
    required this.tipoCompra,
    required this.total,
    required this.nombreFactura,
    required this.tasaDolar,
    required this.vendedor,
    required this.zona,
    required this.createdAt,
  });

  String tipoCompra;
  int total;
  String nombreFactura;
  int tasaDolar;
  String vendedor;
  String zona;
  CreatedAt createdAt;

  factory InfoFactura.fromJson(Map<String, dynamic> json) => InfoFactura(
        tipoCompra: json["TipoCompra"],
        total: json["Total"],
        nombreFactura: json["NombreFactura"],
        tasaDolar: json["TasaDolar"],
        vendedor: json["Vendedor"],
        zona: json["Zona"],
        createdAt: CreatedAt.fromJson(json["created_at"]),
      );

  Map<String, dynamic> toJson() => {
        "TipoCompra": tipoCompra,
        "Total": total,
        "NombreFactura": nombreFactura,
        "TasaDolar": tasaDolar,
        "Vendedor": vendedor,
        "Zona": zona,
        "created_at": createdAt.toJson(),
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
