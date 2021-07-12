// To parse this JSON data, do
//
//     final detalleFacturaCosmeticos = detalleFacturaCosmeticosFromJson(jsonString);

import 'dart:convert';

DetallePreFacturaCosmeticos ParsedetallePreFacturaCosmeticos(
        String responseBody) =>
    DetallePreFacturaCosmeticos.fromJson(json.decode(responseBody));

class DetallePreFacturaCosmeticos {
  DetallePreFacturaCosmeticos({
    required this.infoFactura,
    required this.detalleFactura,
  });

  List<InfoPreFactura> infoFactura;
  List<DetallePreFactura> detalleFactura;

  factory DetallePreFacturaCosmeticos.fromJson(Map<String, dynamic> json) =>
      DetallePreFacturaCosmeticos(
        infoFactura: List<InfoPreFactura>.from(
            json["InfoFactura"].map((x) => InfoPreFactura.fromJson(x))),
        detalleFactura: List<DetallePreFactura>.from(
            json["DetalleFactura"].map((x) => DetallePreFactura.fromJson(x))),
      );
}

class DetallePreFactura {
  DetallePreFactura(
      {required this.tasaDolar,
      required this.producto,
      required this.cantidad,
      required this.precio,
      required this.stock,
      required this.imagenApk,
      required this.medida,
      required this.presentacion,
      required this.UndPaquete,
      required this.Cajones});

  double tasaDolar;
  String producto;
  int cantidad;
  double precio;
  int stock;
  String imagenApk;
  String medida;
  String presentacion;
  int UndPaquete;
  int Cajones;
  factory DetallePreFactura.fromJson(Map<String, dynamic> json) =>
      DetallePreFactura(
          producto: json["Producto"],
          tasaDolar: 0.00,
          cantidad: json["Cantidad"],
          precio: double.parse(json["Precio"]),
          stock: json["Stock"],
          imagenApk: json["ImagenAPK"],
          medida: json["Medida"],
          presentacion: json["Presentacion"],
          UndPaquete: json["UndPaquete"],
          Cajones: json["Cajones"]);
}

class InfoPreFactura {
  InfoPreFactura(
      {required this.tipoCompra,
      required this.total,
      required this.nombreFactura,
      required this.vendedor,
      required this.zona,
      required this.createdAt,
      required this.tasaDolar});

  String tipoCompra;
  double total;
  double tasaDolar;
  String nombreFactura;
  String vendedor;
  String zona;
  CreatedAt createdAt;

  factory InfoPreFactura.fromJson(Map<String, dynamic> json) => InfoPreFactura(
        tasaDolar: 0.00,
        tipoCompra: json["TipoCompra"],
        total: double.parse(json["Total"]),
        nombreFactura: json["NombreCliente"],
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
