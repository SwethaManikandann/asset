/**
 * The custom logic to simulate depreciation calculations for asset valuation.
 * @On(event = { "valuatedepreciation" }, entity = "assetmanagementSrv.Assets")
 * @param {cds.Request} request - User information, tenant-specific CDS model, headers and query parameters
*/
module.exports = async function(request) {
  const { Assets } = cds.entities;
  const assetID = request.data.assetID;

  if (!assetID) {
    return request.reject(400, 'Asset ID is required for depreciation valuation.');
  }

  // Retrieve the asset details
  const asset = await SELECT.one.from(Assets).where({ assetsID: assetID });

  if (!asset) {
    return request.reject(404, `Asset with ID ${assetID} not found.`);
  }

  // Calculate depreciation
  const { acquisitionValue, usefulLife } = asset;
  if (usefulLife === undefined || acquisitionValue === undefined) {
    return request.reject(400, 'Useful life and acquisition value are required for depreciation calculation.');
  }

  const annualDepreciation = acquisitionValue / usefulLife;

  // Return the calculated depreciation value
  return {
    assetID: assetID,
    annualDepreciation: annualDepreciation.toFixed(2)
  };
}
