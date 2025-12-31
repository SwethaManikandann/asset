/**
 * The custom logic to validate inputs before creating legacy asset records.
 * @Before(event = { "CREATE" }, entity = "assetmanagementSrv.LegacyAssets")
 * @param {cds.Request} request - User information, tenant-specific CDS model, headers and query parameters
 */
module.exports = async function(request) {
  const { LegacyAssets } = cds.entities;

  // Extract data from the request
  const { assetNumber, openingBalance } = request.data;

  // Validate assetNumber is not undefined or empty
  if (!assetNumber) {
    return request.reject(400, 'Asset Number is required.');
  }

  // Validate openingBalance is not undefined and is a positive number
  if (openingBalance === undefined || openingBalance <= 0) {
    return request.reject(400, 'Opening Balance must be a positive number.');
  }

  // Check if assetNumber already exists in LegacyAssets
  const existingAsset = await SELECT.one.from(LegacyAssets).where({ assetNumber });
  if (existingAsset) {
    return request.reject(400, `Asset Number '${assetNumber}' already exists.`);
  }
};
