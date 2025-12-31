/**
 * The custom logic to validate inputs before updating asset master records.
 * @Before(event = { "UPDATE" }, entity = "assetmanagementSrv.Assets")
 * @param {cds.Request} request - User information, tenant-specific CDS model, headers and query parameters
 */
module.exports = async function(request) {
  const { Assets } = cds.entities;
  const { data } = request;

  // Ensure assetsID is provided
  if (!data.assetsID) {
    request.reject(400, 'assetsID is mandatory for updating asset records.');
  }

  // Validate assetNumber length
  if (data.assetNumber && data.assetNumber.length > 20) {
    request.reject(400, 'assetNumber must not exceed 20 characters.');
  }

  // Validate assetName length
  if (data.assetName && data.assetName.length > 120) {
    request.reject(400, 'assetName must not exceed 120 characters.');
  }

  // Validate assetClass length
  if (data.assetClass && data.assetClass.length > 40) {
    request.reject(400, 'assetClass must not exceed 40 characters.');
  }

  // Validate costCenter length
  if (data.costCenter && data.costCenter.length > 30) {
    request.reject(400, 'costCenter must not exceed 30 characters.');
  }

  // Validate acquisitionValue
  if (data.acquisitionValue && (data.acquisitionValue < 0 || data.acquisitionValue > 9999999999999.99)) {
    request.reject(400, 'acquisitionValue must be between 0 and 9999999999999.99.');
  }

  // Validate usefulLife
  if (data.usefulLife && data.usefulLife < 0) {
    request.reject(400, 'usefulLife must be a positive integer.');
  }

  // Validate depreciationKey length
  if (data.depreciationKey && data.depreciationKey.length > 10) {
    request.reject(400, 'depreciationKey must not exceed 10 characters.');
  }

  // Validate status length
  if (data.status && data.status.length > 20) {
    request.reject(400, 'status must not exceed 20 characters.');
  }

  // Check if the asset exists
  const assetExists = await SELECT.one.from(Assets).where({ assetsID: data.assetsID });
  if (!assetExists) {
    request.reject(404, 'Asset record not found.');
  }
}
