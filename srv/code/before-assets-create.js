/**
 * The custom logic to validate inputs before creating asset master records.
 * @Before(event = { "CREATE" }, entity = "assetmanagementSrv.Assets")
 * @param {cds.Request} request - User information, tenant-specific CDS model, headers and query parameters
*/
module.exports = async function(request) {
  const { assetsID, assetNumber, assetName, assetClass, costCenter, acquisitionValue, capitalizationDate, usefulLife, depreciationKey, status } = request.data;

  // Validate mandatory fields
  if (!assetsID) {
    request.error(400, 'The assetsID is mandatory and must be provided.');
  }
  
  if (!assetNumber) {
    request.error(400, 'The assetNumber is mandatory and must be provided.');
  }
  
  if (!assetName) {
    request.error(400, 'The assetName is mandatory and must be provided.');
  }

  // Validate acquisitionValue to be a positive number
  if (acquisitionValue !== undefined && acquisitionValue <= 0) {
    request.error(400, 'The acquisitionValue must be a positive number.');
  }

  // Validate capitalizationDate to be a valid date
  if (capitalizationDate !== undefined && isNaN(Date.parse(capitalizationDate))) {
    request.error(400, 'The capitalizationDate must be a valid date.');
  }

  // Validate usefulLife to be a positive integer
  if (usefulLife !== undefined && (!Number.isInteger(usefulLife) || usefulLife <= 0)) {
    request.error(400, 'The usefulLife must be a positive integer.');
  }

  // Validate status to be one of the predefined values
  const validStatuses = ['Active', 'Inactive', 'Under Maintenance'];
  if (status !== undefined && !validStatuses.includes(status)) {
    request.error(400, `The status must be one of the following: ${validStatuses.join(', ')}.`);
  }
};
