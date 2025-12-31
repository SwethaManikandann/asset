/**
 * The custom logic to perform calculations or transformations after reading asset master records.
 * @After(event = { "READ" }, entity = "assetmanagementSrv.Assets")
 * @param {(Object|Object[])} results - For the After phase only: the results of the event processing
 * @param {cds.Request} request - User information, tenant-specific CDS model, headers and query parameters
*/
module.exports = async function(results, request) {
  if (!results) return;

  // Ensure results is an array for uniform processing
  const assets = Array.isArray(results) ? results : [results];

  for (const asset of assets) {
    // Perform calculations or transformations
    if (asset.acquisitionValue && asset.usefulLife) {
      // Calculate annual depreciation
      asset.annualDepreciation = asset.acquisitionValue / asset.usefulLife;
    }

    // Transformations or additional calculations can be added here
    // Example: Add a status description based on the status code
    switch (asset.status) {
      case 'active':
        asset.statusDescription = 'Asset is active';
        break;
      case 'inactive':
        asset.statusDescription = 'Asset is inactive';
        break;
      case 'disposed':
        asset.statusDescription = 'Asset has been disposed';
        break;
      default:
        asset.statusDescription = 'Unknown status';
    }
  }
}
