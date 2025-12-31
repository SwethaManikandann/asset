/**
 * The custom logic to perform month-end closing operations for asset accounting.
 * @On(event = { "monthendclosing" }, entity = "assetmanagementSrv.Assets")
 * @param {cds.Request} request - User information, tenant-specific CDS model, headers and query parameters
 */
module.exports = async function(request) {
    const { Assets, DepreciationRuns } = cds.entities;

    // Fetch all assets that are active and need month-end processing
    const assets = await SELECT.from(Assets).where({ status: 'active' });

    if (!assets || assets.length === 0) {
        return; // No assets to process
    }

    // Iterate over each asset to perform month-end closing operations
    for (const asset of assets) {
        // Calculate depreciation for the asset
        const depreciationAmount = calculateDepreciation(asset);

        // Insert a new depreciation run record
        await INSERT.into(DepreciationRuns).columns(
            'assetID', 'period', 'year', 'depreciationAmount'
        ).values(
            asset.assetsID, getCurrentPeriod(), getCurrentYear(), depreciationAmount
        );

        // Update the asset status to 'closed' for the month-end
        await cds.run(UPDATE(Assets).set({ status: 'closed' }).where({ assetsID: asset.assetsID }));
    }
};

/**
 * Calculate depreciation amount for the asset.
 * @param {Object} asset - The asset entity object
 * @returns {Decimal} - The calculated depreciation amount
 */
function calculateDepreciation(asset) {
    // Implement depreciation calculation logic based on asset properties
    // For example, using straight-line depreciation method
    const annualDepreciation = asset.acquisitionValue / asset.usefulLife;
    const monthlyDepreciation = annualDepreciation / 12;
    return monthlyDepreciation;
}

/**
 * Get the current period for month-end closing.
 * @returns {Integer} - The current period (month)
 */
function getCurrentPeriod() {
    const currentDate = new Date();
    return currentDate.getMonth() + 1; // Months are zero-indexed in JavaScript
}

/**
 * Get the current year for month-end closing.
 * @returns {Integer} - The current year
 */
function getCurrentYear() {
    const currentDate = new Date();
    return currentDate.getFullYear();
}
