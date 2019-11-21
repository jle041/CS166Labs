CREATE INDEX supplier_id_index
ON supplier
[USING BTREE]
(supplier_id);

CREATE INDEX supplier_name_index
ON supplier
[USING BTREE]
(supplier_name);

CREATE INDEX part_nyc_part_number_index
ON part_nyc
[USING BTREE]
(part_number);

CREATE INDEX part_nyc_supplier_index
ON part_nyc
[USING BTREE]
(supplier);

CREATE INDEX part_nyc_color_index
ON part_nyc
[USING BTREE]
(color);

CREATE INDEX part_nyc_on_hand_index
ON part_nyc
[USING BTREE]
(on_hand);

CREATE INDEX part_sfo_part_number_index
ON part_sfo
[USING BTREE]
(part_number);

CREATE INDEX part_sfo_supplier_index
ON part_sfo
[USING BTREE]
(supplier);

CREATE INDEX part_sfo_color_index
ON part_sfo
[USING BTREE]
(color);

CREATE INDEX part_sfo_on_hand_index
ON part_sfo
[USING BTREE]
(on_hand);
