class TaskStatusCount {
  String? status;
  List<DataList>? data;

  TaskStatusCount({this.status, this.data});

  TaskStatusCount.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <DataList>[];
      json['data'].forEach((v) {
        data!.add(DataList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DataList {
  String? sId;
  int? sum;

  DataList({this.sId, this.sum});

  DataList.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    sum = json['sum'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['sum'] = sum;
    return data;
  }
}