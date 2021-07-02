// To parse this JSON data, do
//
//     final detalleFacturaCosmeticos = detalleFacturaCosmeticosFromJson(jsonString);

import 'dart:convert';

DetalleFacturaCosmeticos ParsedetalleFacturaCosmeticos(String responseBody) =>
    DetalleFacturaCosmeticos.fromJson(json.decode(responseBody));

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
}

class DetalleFactura {
  DetalleFactura(
      {required this.producto,
      required this.cantidad,
      required this.precio,
      required this.stock,
      required this.imagenApk,
      required this.medida,
      required this.presentacion});

  String producto;
  int cantidad;
  double precio;
  int stock;
  String imagenApk;
  String medida;
  String presentacion;
  factory DetalleFactura.fromJson(Map<String, dynamic> json) => DetalleFactura(
      producto: json["Producto"],
      cantidad: json["Cantidad"],
      precio: (json["Precio"]).toDouble(),
      stock: json["Stock"],
      imagenApk: json["ImagenAPK"],
      medida: json["Medida"],
      presentacion: json["Presentacion"]);
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
  double total;
  String nombreFactura;
  double tasaDolar;
  String vendedor;
  String zona;
  CreatedAt createdAt;

  factory InfoFactura.fromJson(Map<String, dynamic> json) => InfoFactura(
        tipoCompra: json["TipoCompra"],
        total: (json["Total"]).toDouble(),
        nombreFactura: json["NombreFactura"],
        tasaDolar: (json["TasaDolar"]).toDouble(),
        vendedor: json["Vendedor"],
        zona: json["Zona"],
        createdAt: CreatedAt.fromJson(json["created_at"]),
      );
}

class CreatedAt {
  CreatedAt({
    required this.date,
    //required this.timezoneType,
    required this.timezone,
  });

  DateTime date;
  //double timezoneType;
  String timezone;

  factory CreatedAt.fromJson(Map<String, dynamic> json) => CreatedAt(
        date: DateTime.parse(json["date"]),
        //timezoneType: json["timezone_type"],
        timezone: json["timezone"],
      );
}
