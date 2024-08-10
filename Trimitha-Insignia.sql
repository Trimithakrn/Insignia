SELECT 
    p.id,
    p.name,
    COUNT(pt.id) AS jumlah_terjual,
    EXTRACT(YEAR FROM pt.created_at) AS tahun,
    EXTRACT(MONTH FROM pt.created_at) AS bulan
FROM 
    bigquery-public-data.thelook_ecommerce.products p
LEFT JOIN 
    bigquery-public-data.thelook_ecommerce.order_items pt ON p.id = pt.product_id
GROUP BY 
    p.id, p.name, tahun, bulan
ORDER BY 
    jumlah_terjual DESC,
    tahun DESC,
    bulan DESC
LIMIT 1000;
