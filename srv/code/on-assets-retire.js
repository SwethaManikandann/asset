/**
 * The custom logic to handle asset retirement operations, including status transitions and document number simulation.
 * @On(event = { "retire" }, entity = "assetmanagementSrv.Assets")
 * @param {cds.Request} request - User information, tenant-specific CDS model, headers and query parameters
 */
module.exports = async function(request) {
  const { Assets, PurchaseRequisitions, PurchaseOrders, GoodsReceipts, VendorInvoices, DepreciationRuns } = cds.entities;
  
  const assetID = request.data.ID;
  if (!assetID) {
    return request.reject(400, 'Asset ID is required for retirement operation.');
  }

  // Fetch the asset to ensure it exists and is not already retired
  const asset = await SELECT.one.from(Assets).where({ ID: assetID });
  if (!asset) {
    return request.reject(404, 'Asset not found.');
  }
  if (asset.status === 'Retired') {
    return request.reject(400, 'Asset is already retired.');
  }

  // Simulate document number generation for retirement operation
  const retirementDocumentNumber = `RET-${Date.now()}`;

  // Update the asset status to 'Retired'
  asset.status = 'Retired';

  // Update the asset in the database
  await UPDATE(Assets).set({ status: asset.status }).where({ ID: assetID });

  // Optionally, handle related entities like PurchaseRequisitions, PurchaseOrders, etc.
  // For example, update status of related PurchaseRequisitions to 'Closed'
  await UPDATE(PurchaseRequisitions).set({ status: 'Closed' }).where({ assetID });

  // Return the retirement document number as part of the response
  return { retirementDocumentNumber };
}
