class FrameworkCertModel {
  final int id; // Add this line

  final String certUniqueId; // Nullable
  final String certGroup;
  final int certType;
  final String sort;
  final int competence;
  final String title;
  final int certStatus;
  final int validDayTick;
  final int notuseValidDay;
  final int notuseValidHour;
  final int validHourTick;
  final int isCos;
  final int isMajorCos;
  final int isIntermediateCos;
  final String certificateFormat;
  final String comments;
  final int parentId;
  final int createdBy;
  final String createdOn;
  final int updatedBy;
  final String updatedOn;
  final int published;
  final String syncDate;

  FrameworkCertModel({
    required this.id, // Update constructor to require id

    required this.certUniqueId, // Nullable
    required this.certGroup,
    required this.certType,
    required this.sort,
    required this.competence,
    required this.title,
    required this.certStatus,
    required this.validDayTick,
    required this.notuseValidDay,
    required this.notuseValidHour,
    required this.validHourTick,
    required this.isCos,
    required this.isMajorCos,
    required this.isIntermediateCos,
    required this.certificateFormat,
    required this.comments,
    required this.parentId,
    required this.createdBy,
    required this.createdOn,
    required this.updatedBy,
    required this.updatedOn,
    required this.published,
    required this.syncDate,
  });

  factory FrameworkCertModel.fromJson(Map<String, dynamic> json) {
    return FrameworkCertModel(
      id: json['id'] as int, // Extract id from JSON

      certUniqueId: json['cert_unique_id'], // Nullable
      certGroup: json['cert_group'] as String? ?? '', // Provide a default value
      certType: json['cert_type'] as int? ?? 0, // Provide a default value
      sort: json['sort'] as String? ?? '', // Provide a default value
      competence: json['competence'] as int? ?? 0, // Provide a default value
      title: json['title'] as String? ?? '', // Provide a default value
      certStatus: json['cert_status'] as int? ?? 0, // Provide a default value
      validDayTick:
          json['valid_day_tick'] as int? ?? 0, // Provide a default value
      notuseValidDay:
          json['notuse_valid_day'] as int? ?? 0, // Provide a default value
      notuseValidHour:
          json['notuse_valid_hour'] as int? ?? 0, // Provide a default value
      validHourTick:
          json['valid_hour_tick'] as int? ?? 0, // Provide a default value
      isCos: json['is_cos'] as int? ?? 0, // Provide a default value
      isMajorCos: json['is_major_cos'] as int? ?? 0, // Provide a default value
      isIntermediateCos:
          json['is_intermediate_cos'] as int? ?? 0, // Provide a default value
      certificateFormat: json['certificate_format'] as String? ??
          '', // Provide a default value
      comments: json['comments'] as String? ?? '', // Provide a default value
      parentId: json['parent_id'] as int? ?? 0, // Provide a default value
      createdBy: json['created_by'] as int? ?? 0, // Provide a default value
      createdOn: json['created_on'] as String? ?? '', // Provide a default value
      updatedBy: json['updated_by'] as int? ?? 0, // Provide a default value
      updatedOn: json['updated_on'] as String? ?? '', // Provide a default value
      published: json['published'] as int? ?? 0, // Provide a default value
      syncDate: json['sync_date'] as String? ?? '', // Provide a default value
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id, // Include id in toJson

      'cert_unique_id': certUniqueId,
      'cert_group': certGroup,
      'cert_type': certType,
      'sort': sort,
      'competence': competence,
      'title': title,
      'cert_status': certStatus,
      'valid_day_tick': validDayTick,
      'notuse_valid_day': notuseValidDay,
      'notuse_valid_hour': notuseValidHour,
      'valid_hour_tick': validHourTick,
      'is_cos': isCos,
      'is_major_cos': isMajorCos,
      'is_intermediate_cos': isIntermediateCos,
      'certificate_format': certificateFormat,
      'comments': comments,
      'parent_id': parentId,
      'created_by': createdBy,
      'created_on': createdOn,
      'updated_by': updatedBy,
      'updated_on': updatedOn,
      'published': published,
      'sync_date': syncDate,
    };
  }
}
