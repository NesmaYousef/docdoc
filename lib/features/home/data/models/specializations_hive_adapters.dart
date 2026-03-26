import 'package:hive/hive.dart';
import 'specializations_response_model.dart';

class SpecializationsResponseModelAdapter extends TypeAdapter<SpecializationsResponseModel> {
  @override
  final int typeId = 0;

  @override
  SpecializationsResponseModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SpecializationsResponseModel()
      ..specializationDataList = (fields[0] as List?)?.cast<SpecializationsData?>();
  }

  @override
  void write(BinaryWriter writer, SpecializationsResponseModel obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.specializationDataList);
  }
}

class SpecializationsDataAdapter extends TypeAdapter<SpecializationsData> {
  @override
  final int typeId = 1;

  @override
  SpecializationsData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SpecializationsData(
      id: fields[0] as int?,
      name: fields[1] as String?,
      doctorsList: (fields[2] as List?)?.cast<Doctors?>(),
    );
  }

  @override
  void write(BinaryWriter writer, SpecializationsData obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.doctorsList);
  }
}

class DoctorsAdapter extends TypeAdapter<Doctors> {
  @override
  final int typeId = 2;

  @override
  Doctors read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Doctors(
      id: fields[0] as int?,
      name: fields[1] as String?,
      email: fields[2] as String?,
      phone: fields[3] as String?,
      photo: fields[4] as String?,
      gender: fields[5] as String?,
      price: fields[6] as int?,
      degree: fields[7] as String? ?? '',
    );
  }

  @override
  void write(BinaryWriter writer, Doctors obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.email)
      ..writeByte(3)
      ..write(obj.phone)
      ..writeByte(4)
      ..write(obj.photo)
      ..writeByte(5)
      ..write(obj.gender)
      ..writeByte(6)
      ..write(obj.price)
      ..writeByte(7)
      ..write(obj.degree);
  }
}
