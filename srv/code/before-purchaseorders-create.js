/**
 * The custom logic to validate inputs before creating purchase orders for asset acquisition.
 * @Before(event = { "CREATE" }, entity = "assetmanagementSrv.PurchaseOrders")
 * @param {cds.Request} request - User information, tenant-specific CDS model, headers and query parameters
*/
module.exports = async function(request) {
  const { Assets } = cds.entities;

  // Extract assetID from the request data
  const { assetID } = request.data;

  // Check if assetID is provided
  if (!assetID) {
    request.reject(400, 'Asset ID is required for creating a purchase order.');
    return;
  }

  // Fetch the asset details from the Assets entity
  const asset = await SELECT.one.from(Assets).where({ assetsID: assetID });

  // Validate if the asset exists
  if (!asset) {
    request.reject(404, `Asset with ID ${assetID} does not exist.`);
    return;
  }

  // Validate the asset status for acquisition
  if (asset.status !== 'Available') {
    request.reject(400, `Asset with ID ${assetID} is not available for acquisition.`);
    return;
  }

  // Additional validation logic can be added here if needed
};
