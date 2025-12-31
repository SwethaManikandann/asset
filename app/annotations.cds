using { assetmanagementSrv } from '../srv/service.cds';

annotate assetmanagementSrv.Assets with @UI.HeaderInfo: {
  TypeName: 'Asset',
  TypeNamePlural: 'Assets',
  Title: { Value: assetName },
  Description: { Value: assetNumber }
};

annotate assetmanagementSrv.Assets with @UI.PresentationVariant: {
  SortOrder: [{ Property: capitalizationDate, Descending: true }],
  Visualizations: ['@UI.LineItem']
};

annotate assetmanagementSrv.Assets with @UI.SelectionFields: [
  assetNumber,
  assetName
];

annotate assetmanagementSrv.Assets with @UI.LineItem: [
 { $Type: 'UI.DataField', Value: assetNumber },
 { $Type: 'UI.DataField', Value: assetName },
 { $Type: 'UI.DataField', Value: assetClass },
 { $Type: 'UI.DataField', Value: costCenter },
 { $Type: 'UI.DataField', Value: acquisitionValue },
 { $Type: 'UI.DataField', Value: capitalizationDate },
 { $Type: 'UI.DataField', Value: usefulLife },
 { $Type: 'UI.DataField', Value: depreciationKey },
 { $Type: 'UI.DataField', Value: status }
];

annotate assetmanagementSrv.Assets with @UI.FieldGroup #Main: {
  $Type: 'UI.FieldGroupType', Data: [
 { $Type: 'UI.DataField', Value: assetNumber },
 { $Type: 'UI.DataField', Value: assetName },
 { $Type: 'UI.DataField', Value: assetClass },
 { $Type: 'UI.DataField', Value: costCenter },
 { $Type: 'UI.DataField', Value: acquisitionValue },
 { $Type: 'UI.DataField', Value: capitalizationDate },
 { $Type: 'UI.DataField', Value: usefulLife },
 { $Type: 'UI.DataField', Value: depreciationKey },
 { $Type: 'UI.DataField', Value: status }
  ]
};

annotate assetmanagementSrv.Assets with @UI.Facets: [
  { $Type: 'UI.ReferenceFacet', ID: 'Main', Label: 'General Information', Target: '@UI.FieldGroup#Main' }
];

annotate assetmanagementSrv.Assets with {
  status @Common.ValueList: {
    CollectionPath: 'StatusValues',
    Label: 'Status',
    Parameters: [
      { $Type: 'Common.ValueListParameterInOut', LocalDataProperty: status, ValueListProperty: 'code' },
      { $Type: 'Common.ValueListParameterDisplayOnly', ValueListProperty: 'text' }
    ]
  };
};

annotate assetmanagementSrv.PurchaseRequisitions with @UI.HeaderInfo: { TypeName: 'Purchase Requisition', TypeNamePlural: 'Purchase Requisitions', Title: { Value: purchaseRequisitionsID } };
annotate assetmanagementSrv.PurchaseRequisitions with {
  ID @UI.Hidden @Common.Text: { $value: purchaseRequisitionsID, ![@UI.TextArrangement]: #TextOnly }
};
annotate assetmanagementSrv.PurchaseRequisitions with @UI.Identification: [{ Value: purchaseRequisitionsID }];
annotate assetmanagementSrv.PurchaseRequisitions with {
  purchaseRequisitionsID @title: 'ID';
  prNumber @title: 'PR Number';
  assetID @title: 'Asset ID';
  status @title: 'Status'
};

annotate assetmanagementSrv.PurchaseRequisitions with @UI.LineItem: [
 { $Type: 'UI.DataField', Value: purchaseRequisitionsID },
 { $Type: 'UI.DataField', Value: prNumber },
 { $Type: 'UI.DataField', Value: assetID },
 { $Type: 'UI.DataField', Value: status }
];

annotate assetmanagementSrv.PurchaseRequisitions with @UI.FieldGroup #Main: {
  $Type: 'UI.FieldGroupType', Data: [
 { $Type: 'UI.DataField', Value: purchaseRequisitionsID },
 { $Type: 'UI.DataField', Value: prNumber },
 { $Type: 'UI.DataField', Value: assetID },
 { $Type: 'UI.DataField', Value: status }
  ]
};

annotate assetmanagementSrv.PurchaseRequisitions with @UI.Facets: [
  { $Type: 'UI.ReferenceFacet', ID: 'Main', Label: 'General Information', Target: '@UI.FieldGroup#Main' }
];

annotate assetmanagementSrv.PurchaseRequisitions with @UI.SelectionFields: [
  purchaseRequisitionsID
];

annotate assetmanagementSrv.PurchaseOrders with @UI.HeaderInfo: { TypeName: 'Purchase Order', TypeNamePlural: 'Purchase Orders', Title: { Value: purchaseOrdersID } };
annotate assetmanagementSrv.PurchaseOrders with {
  ID @UI.Hidden @Common.Text: { $value: purchaseOrdersID, ![@UI.TextArrangement]: #TextOnly }
};
annotate assetmanagementSrv.PurchaseOrders with @UI.Identification: [{ Value: purchaseOrdersID }];
annotate assetmanagementSrv.PurchaseOrders with {
  purchaseOrdersID @title: 'ID';
  poNumber @title: 'PO Number';
  assetID @title: 'Asset ID';
  status @title: 'Status'
};

annotate assetmanagementSrv.PurchaseOrders with @UI.LineItem: [
 { $Type: 'UI.DataField', Value: purchaseOrdersID },
 { $Type: 'UI.DataField', Value: poNumber },
 { $Type: 'UI.DataField', Value: assetID },
 { $Type: 'UI.DataField', Value: status }
];

annotate assetmanagementSrv.PurchaseOrders with @UI.FieldGroup #Main: {
  $Type: 'UI.FieldGroupType', Data: [
 { $Type: 'UI.DataField', Value: purchaseOrdersID },
 { $Type: 'UI.DataField', Value: poNumber },
 { $Type: 'UI.DataField', Value: assetID },
 { $Type: 'UI.DataField', Value: status }
  ]
};

annotate assetmanagementSrv.PurchaseOrders with @UI.Facets: [
  { $Type: 'UI.ReferenceFacet', ID: 'Main', Label: 'General Information', Target: '@UI.FieldGroup#Main' }
];

annotate assetmanagementSrv.PurchaseOrders with @UI.SelectionFields: [
  purchaseOrdersID
];

annotate assetmanagementSrv.GoodsReceipts with @UI.HeaderInfo: { TypeName: 'Goods Receipt', TypeNamePlural: 'Goods Receipts', Title: { Value: goodsReceiptsID } };
annotate assetmanagementSrv.GoodsReceipts with {
  ID @UI.Hidden @Common.Text: { $value: goodsReceiptsID, ![@UI.TextArrangement]: #TextOnly }
};
annotate assetmanagementSrv.GoodsReceipts with @UI.Identification: [{ Value: goodsReceiptsID }];
annotate assetmanagementSrv.GoodsReceipts with {
  goodsReceiptsID @title: 'ID';
  grNumber @title: 'GR Number';
  assetID @title: 'Asset ID';
  postingDate @title: 'Posting Date';
  status @title: 'Status'
};

annotate assetmanagementSrv.GoodsReceipts with @UI.LineItem: [
 { $Type: 'UI.DataField', Value: goodsReceiptsID },
 { $Type: 'UI.DataField', Value: grNumber },
 { $Type: 'UI.DataField', Value: assetID },
 { $Type: 'UI.DataField', Value: postingDate },
 { $Type: 'UI.DataField', Value: status }
];

annotate assetmanagementSrv.GoodsReceipts with @UI.FieldGroup #Main: {
  $Type: 'UI.FieldGroupType', Data: [
 { $Type: 'UI.DataField', Value: goodsReceiptsID },
 { $Type: 'UI.DataField', Value: grNumber },
 { $Type: 'UI.DataField', Value: assetID },
 { $Type: 'UI.DataField', Value: postingDate },
 { $Type: 'UI.DataField', Value: status }
  ]
};

annotate assetmanagementSrv.GoodsReceipts with @UI.Facets: [
  { $Type: 'UI.ReferenceFacet', ID: 'Main', Label: 'General Information', Target: '@UI.FieldGroup#Main' }
];

annotate assetmanagementSrv.GoodsReceipts with @UI.SelectionFields: [
  goodsReceiptsID
];

annotate assetmanagementSrv.VendorInvoices with @UI.HeaderInfo: { TypeName: 'Vendor Invoice', TypeNamePlural: 'Vendor Invoices', Title: { Value: vendorInvoicesID } };
annotate assetmanagementSrv.VendorInvoices with {
  ID @UI.Hidden @Common.Text: { $value: vendorInvoicesID, ![@UI.TextArrangement]: #TextOnly }
};
annotate assetmanagementSrv.VendorInvoices with @UI.Identification: [{ Value: vendorInvoicesID }];
annotate assetmanagementSrv.VendorInvoices with {
  vendorInvoicesID @title: 'ID';
  invoiceNumber @title: 'Invoice Number';
  assetID @title: 'Asset ID';
  amount @title: 'Amount';
  postingDate @title: 'Posting Date';
  status @title: 'Status'
};

annotate assetmanagementSrv.VendorInvoices with @UI.LineItem: [
 { $Type: 'UI.DataField', Value: vendorInvoicesID },
 { $Type: 'UI.DataField', Value: invoiceNumber },
 { $Type: 'UI.DataField', Value: assetID },
 { $Type: 'UI.DataField', Value: amount },
 { $Type: 'UI.DataField', Value: postingDate },
 { $Type: 'UI.DataField', Value: status }
];

annotate assetmanagementSrv.VendorInvoices with @UI.FieldGroup #Main: {
  $Type: 'UI.FieldGroupType', Data: [
 { $Type: 'UI.DataField', Value: vendorInvoicesID },
 { $Type: 'UI.DataField', Value: invoiceNumber },
 { $Type: 'UI.DataField', Value: assetID },
 { $Type: 'UI.DataField', Value: amount },
 { $Type: 'UI.DataField', Value: postingDate },
 { $Type: 'UI.DataField', Value: status }
  ]
};

annotate assetmanagementSrv.VendorInvoices with @UI.Facets: [
  { $Type: 'UI.ReferenceFacet', ID: 'Main', Label: 'General Information', Target: '@UI.FieldGroup#Main' }
];

annotate assetmanagementSrv.VendorInvoices with @UI.SelectionFields: [
  vendorInvoicesID
];

annotate assetmanagementSrv.DepreciationRuns with @UI.HeaderInfo: { TypeName: 'Depreciation Run', TypeNamePlural: 'Depreciation Runs', Title: { Value: depreciationRunsID } };
annotate assetmanagementSrv.DepreciationRuns with {
  ID @UI.Hidden @Common.Text: { $value: depreciationRunsID, ![@UI.TextArrangement]: #TextOnly }
};
annotate assetmanagementSrv.DepreciationRuns with @UI.Identification: [{ Value: depreciationRunsID }];
annotate assetmanagementSrv.DepreciationRuns with {
  depreciationRunsID @title: 'ID';
  assetID @title: 'Asset ID';
  period @title: 'Period';
  year @title: 'Year';
  depreciationAmount @title: 'Depreciation Amount'
};

annotate assetmanagementSrv.DepreciationRuns with @UI.LineItem: [
 { $Type: 'UI.DataField', Value: depreciationRunsID },
 { $Type: 'UI.DataField', Value: assetID },
 { $Type: 'UI.DataField', Value: period },
 { $Type: 'UI.DataField', Value: year },
 { $Type: 'UI.DataField', Value: depreciationAmount }
];

annotate assetmanagementSrv.DepreciationRuns with @UI.FieldGroup #Main: {
  $Type: 'UI.FieldGroupType', Data: [
 { $Type: 'UI.DataField', Value: depreciationRunsID },
 { $Type: 'UI.DataField', Value: assetID },
 { $Type: 'UI.DataField', Value: period },
 { $Type: 'UI.DataField', Value: year },
 { $Type: 'UI.DataField', Value: depreciationAmount }
  ]
};

annotate assetmanagementSrv.DepreciationRuns with @UI.Facets: [
  { $Type: 'UI.ReferenceFacet', ID: 'Main', Label: 'General Information', Target: '@UI.FieldGroup#Main' }
];

annotate assetmanagementSrv.DepreciationRuns with @UI.SelectionFields: [
  depreciationRunsID
];

annotate assetmanagementSrv.LegacyAssets with @UI.HeaderInfo: { TypeName: 'Legacy Asset', TypeNamePlural: 'Legacy Assets', Title: { Value: legacyAssetsID } };
annotate assetmanagementSrv.LegacyAssets with {
  ID @UI.Hidden @Common.Text: { $value: legacyAssetsID, ![@UI.TextArrangement]: #TextOnly }
};
annotate assetmanagementSrv.LegacyAssets with @UI.Identification: [{ Value: legacyAssetsID }];
annotate assetmanagementSrv.LegacyAssets with {
  legacyAssetsID @title: 'ID';
  assetNumber @title: 'Asset Number';
  openingBalance @title: 'Opening Balance'
};

annotate assetmanagementSrv.LegacyAssets with @UI.LineItem: [
 { $Type: 'UI.DataField', Value: legacyAssetsID },
 { $Type: 'UI.DataField', Value: assetNumber },
 { $Type: 'UI.DataField', Value: openingBalance }
];

annotate assetmanagementSrv.LegacyAssets with @UI.FieldGroup #Main: {
  $Type: 'UI.FieldGroupType', Data: [
 { $Type: 'UI.DataField', Value: legacyAssetsID },
 { $Type: 'UI.DataField', Value: assetNumber },
 { $Type: 'UI.DataField', Value: openingBalance }
  ]
};

annotate assetmanagementSrv.LegacyAssets with @UI.Facets: [
  { $Type: 'UI.ReferenceFacet', ID: 'Main', Label: 'General Information', Target: '@UI.FieldGroup#Main' }
];

annotate assetmanagementSrv.LegacyAssets with @UI.SelectionFields: [
  legacyAssetsID
];

