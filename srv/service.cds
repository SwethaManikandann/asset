using { assetmanagement as my } from '../db/schema.cds';

@path: '/service/assetmanagement'
@requires: 'authenticated-user'
service assetmanagementSrv {
  @odata.draft.enabled
  entity Assets as projection on my.Assets;
  @odata.draft.enabled
  entity PurchaseRequisitions as projection on my.PurchaseRequisitions;
  @odata.draft.enabled
  entity PurchaseOrders as projection on my.PurchaseOrders;
  @odata.draft.enabled
  entity GoodsReceipts as projection on my.GoodsReceipts;
  @odata.draft.enabled
  entity VendorInvoices as projection on my.VendorInvoices;
  @odata.draft.enabled
  entity DepreciationRuns as projection on my.DepreciationRuns;
  @odata.draft.enabled
  entity LegacyAssets as projection on my.LegacyAssets;
}