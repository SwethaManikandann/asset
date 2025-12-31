namespace assetmanagement;
using { cuid } from '@sap/cds/common';

@assert.unique: { assetsID: [assetsID] }
entity Assets : cuid {
  assetsID: String(36) @mandatory;
  assetNumber: String(20);
  assetName: String(120);
  assetClass: String(40);
  costCenter: String(30);
  acquisitionValue: Decimal(15,2);
  capitalizationDate: Date;
  usefulLife: Integer;
  depreciationKey: String(10);
  status: String(20);
}

@assert.unique: { purchaseRequisitionsID: [purchaseRequisitionsID] }
entity PurchaseRequisitions : cuid {
  purchaseRequisitionsID: String(36) @mandatory;
  prNumber: String(20);
  assetID: String(36);
  status: String(20);
}

@assert.unique: { purchaseOrdersID: [purchaseOrdersID] }
entity PurchaseOrders : cuid {
  purchaseOrdersID: String(36) @mandatory;
  poNumber: String(20);
  assetID: String(36);
  status: String(20);
}

@assert.unique: { goodsReceiptsID: [goodsReceiptsID] }
entity GoodsReceipts : cuid {
  goodsReceiptsID: String(36) @mandatory;
  grNumber: String(20);
  assetID: String(36);
  postingDate: Date;
  status: String(20);
}

@assert.unique: { vendorInvoicesID: [vendorInvoicesID] }
entity VendorInvoices : cuid {
  vendorInvoicesID: String(36) @mandatory;
  invoiceNumber: String(20);
  assetID: String(36);
  amount: Decimal(15,2);
  postingDate: Date;
  status: String(20);
}

@assert.unique: { depreciationRunsID: [depreciationRunsID] }
entity DepreciationRuns : cuid {
  depreciationRunsID: String(36) @mandatory;
  assetID: String(36);
  period: Integer;
  year: Integer;
  depreciationAmount: Decimal(15,2);
}

@assert.unique: { legacyAssetsID: [legacyAssetsID] }
entity LegacyAssets : cuid {
  legacyAssetsID: String(36) @mandatory;
  assetNumber: String(20);
  openingBalance: Decimal(15,2);
}

