class Disease {
  final int diseaseId;
  final String namedisease;
  final String imagedisease;
  final String descriptiondisease;
  final String symptoms;
  final String syncstatus;
  final int lastupdated;

  Disease({
    required this.diseaseId,
    required this.namedisease,
    required this.imagedisease,
    required this.descriptiondisease,
    required this.symptoms,
    required this.syncstatus,
    required this.lastupdated,
  });
}
