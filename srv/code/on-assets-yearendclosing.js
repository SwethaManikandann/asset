/**
 * The custom logic to perform year-end closing operations for asset accounting.
 * @On(event = { "yearendclosing" }, entity = "assetmanagementSrv.Assets")
 * @param {cds.Request} request - User information, tenant-specific CDS model, headers and query parameters
 */
module.exports = async function(request) {
  const { Assets, DepreciationRuns } = cds.entities;

  // Fetch all assets
  const assets = await SELECT.from(Assets);

  // Check if assets are available
  if (!assets || assets.length === 0) return;

  // Iterate over each asset to perform year-end closing operations
  for (const asset of assets) {
    // Calculate depreciation amount based on useful life and acquisition value
    const depreciationAmount = asset.acquisitionValue / asset.usefulLife;

    // Create a new depreciation run entry for the asset
    await INSERT.into(DepreciationRuns).columns(
      'assetID', 'period', 'year', 'depreciationAmount'
    ).values(
      asset.ID, 12, new Date().getFullYear(), depreciationAmount
    );

    // Update the status of the asset to 'Closed'
    asset.status = 'Closed';
  }
};
