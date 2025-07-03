class DiseasePlantUse {
  final int diseplantId;
  final int diseaseId;
  final int? plantId;
  final String use;
  final String preparation;
  final String indication;
  final String? syncstatus;
  final int? lastupdated;

  const DiseasePlantUse({
    required this.diseplantId,
    required this.diseaseId,
    required this.plantId,
    required this.use,
    required this.preparation,
    required this.indication,
    required this.syncstatus,
    required this.lastupdated,
  });
}
