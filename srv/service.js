const cds = require('@sap/cds');

class assetmanagementSrv extends cds.ApplicationService {
    async init() {
        // Standard OData v4 Default Handlers will be used.
        // Custom logic has been removed to ensure stability.

        return super.init();
    }
}

module.exports = {
    assetmanagementSrv
};