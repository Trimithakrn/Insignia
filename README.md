# Penjelasan SQL Teknikal Test
Trimitha - Teknikal Test

**Query**
```sql
SELECT 
    p.id,
    p.name,
    COUNT(pt.id) AS jumlah_terjual,
    EXTRACT(YEAR FROM pt.created_at) AS tahun,
    EXTRACT(MONTH FROM pt.created_at) AS bulan
```  
**Penjelasan**
SELECT: Bagian ini menentukan kolom-kolom yang ingin diambil dari hasil query:
p.id: Mengambil ID produk dari tabel products.
p.name: Mengambil nama produk dari tabel products.
COUNT(pt.id) AS jumlah_terjual: Menghitung jumlah terjual untuk setiap produk berdasarkan entri di tabel order_items. Kolom ini akan menunjukkan jumlah total penjualan untuk setiap produk.
EXTRACT(YEAR FROM pt.created_at) AS tahun: Mengekstrak tahun dari kolom created_at di tabel order_items. Ini mengelompokkan data penjualan berdasarkan tahun.
EXTRACT(MONTH FROM pt.created_at) AS bulan: Mengekstrak bulan dari kolom created_at di tabel order_items. Ini mengelompokkan data penjualan berdasarkan bulan.

**Query**
```sql
FROM 
    bigquery-public-data.thelook_ecommerce.products p
```
 
**Penjelasan**
Bagian ini menunjukkan bahwa data utama diambil dari tabel products dalam dataset thelook_ecommerce di BigQuery. Tabel ini berisi informasi produk, dan alias p digunakan untuk merujuk tabel ini di seluruh query.

**Query**
```sql
LEFT JOIN 
    bigquery-public-data.thelook_ecommerce.order_items pt ON p.id = pt.product_id
```

**Penjelasan**
Bagian ini menggabungkan tabel products dengan tabel order_items berdasarkan kolom id dari products dan kolom product_id dari order_items. LEFT JOIN memastikan bahwa semua produk akan ditampilkan, bahkan jika tidak ada data penjualan yang sesuai di tabel order_items. Alias pt digunakan untuk merujuk ke tabel order_items.

**Query**
```sql
GROUP BY 
    p.id, p.name, tahun, bulan
```

**Penjelasan**
Bagian ini mengelompokkan hasil berdasarkan ID produk, nama produk, tahun, dan bulan. Ini diperlukan untuk menghitung jumlah terjual per produk dalam setiap bulan dan tahun.

**Query**
```sql
ORDER BY 
    jumlah_terjual DESC,
    tahun DESC,
    bulan DESC
```

**Penjelasan**
Bagian ini mengurutkan hasil berdasarkan jumlah terjual secara menurun (dari terbanyak ke sedikit), kemudian berdasarkan tahun secara menurun (tahun terbaru di atas), dan akhirnya berdasarkan bulan secara menurun (bulan terbaru di atas).

**Query**
```sql
LIMIT 1000;
```
**Penjelasan**
Batasan ini menentukan bahwa hanya 1000 baris pertama dari hasil query yang akan ditampilkan. 
