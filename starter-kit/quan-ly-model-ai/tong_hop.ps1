
# Tac gia: Do Thanh Chung
# Ngay tao: 10/11/2026
Write-Host "Dang tao bao cao..."
"=== BAO CAO VAN HANH MODEL AI ===" > .\logs\tong_hop.txt
Get-Content .\logs\inference.log | Select-String "WARNING" >> .\logs\tong_hop.txt
(Get-Content .\logs\inference.log | Select-String "ERROR").Count >> .\logs\tong_hop.txt
Write-Host "Hoan thanh!"