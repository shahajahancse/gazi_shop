ALTER TABLE `db_items` ADD `mr_price` DECIMAL(12,2) NOT NULL DEFAULT '0' AFTER `purchase_price`;
ALTER TABLE `db_items` ADD `dif_price` DECIMAL(12,2) NULL DEFAULT '0' COMMENT 'with out discount' AFTER `sales_price`;
ALTER TABLE `db_salesitems` ADD `additional_dis` DECIMAL(12,2) NULL DEFAULT '0' COMMENT 'extra dis amount' AFTER `discount_amt`;
ALTER TABLE `db_salesitems` ADD `mr_price` DECIMAL(12,2) NOT NULL DEFAULT '0' COMMENT 'mrp price' AFTER `sales_qty`;












