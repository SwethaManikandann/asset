/**
 * The custom logic to validate inputs before updating purchase orders for asset acquisition.
 * @Before(event = { "UPDATE" }, entity = "assetmanagementSrv.PurchaseOrders")
 * @param {cds.Request} request - User information, tenant-specific CDS model, headers and query parameters
*/
module.exports = async function(request) {
    const { PurchaseOrders, Assets } = cds.entities;

    // Extract assetID from the request data
    const assetID = request.data.assetID;

    // Check if assetID is provided
    if (!assetID) {
        request.reject(400, 'Asset ID is required for updating purchase orders.');
        return;
    }

    // Fetch the asset associated with the assetID
    const asset = await SELECT.one.from(Assets).where({ ID: assetID });

    // Check if the asset exists
    if (!asset) {
        request.reject(404, `Asset with ID ${assetID} does not exist.`);
        return;
    }

    // Validate the asset status
    if (asset.status !== 'Active') {
        request.reject(400, `Asset with ID ${assetID} is not active and cannot be used for purchase orders.`);
        return;
    }

    // Additional validation logic can be added here if needed
};
