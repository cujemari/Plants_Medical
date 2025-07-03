class Distribution {
  final int distributionId;
  final int? plantId;
  final String imagenmap;
  final String descriptiondistribution;
  final String? syncstatus;
  final int? lastupdated;

  Distribution({
    required this.distributionId,
    this.plantId,
    required this.imagenmap,
    required this.descriptiondistribution,
    this.syncstatus,
    this.lastupdated,
  });
}
