# BÀI LÀM –(CHỦ ĐỀ QUẢN LÝ MODEL AI)

- **Mã đề:**
- **Họ tên:** Đỗ Thành Chung
- **Lớp:**CNTT03
- **Link repository:**
- **Hệ điều hành (Windows/macOS):** Windows

## 4.2. Thao tác máy tính cơ bản bằng CLI

### Các lệnh đã chạy

```shell
pwd
ls
mv .\tai_lieu_ban_giao.txt .\docs\
 mkdir backup
cp .\data\chi_tieu_model_thang_11.xlsx .\backup
cp .\data\chi_tieu_model_thang_11.xlsx .\backup\
 rm .\model_cache_01.tmp
 cd .\logs\
 ls
 cd..
  Get-ChildItem -Force -Recurse
```

### Kết quả liệt kê toàn bộ dự án (Windows: Get-ChildItem -Recurse -Force; macOS: ls -aR)

```text
Directory: C:\Users\Admin\Downloads\MiniPrjoect\starter-kit\quan-ly-model-ai


Mode                 LastWriteTime         Length Name
----                 -------------         ------ ----
d-----        11/10/2026   1:46 PM                backup
d-----        11/10/2026   1:44 PM                data
d-----        11/10/2026   1:45 PM                docs
d-----        11/10/2026   1:42 PM                evidence
d-----        11/10/2026   1:44 PM                logs
d-----        11/10/2026   1:41 PM                web
-a----        11/10/2026   1:41 PM             96 .env
-a----        11/10/2026   1:41 PM           2665 bai_lam.md


    Directory:
    C:\Users\Admin\Downloads\MiniPrjoect\starter-kit\quan-ly-model-ai\backup


Mode                 LastWriteTime         Length Name
----                 -------------         ------ ----
-a----        11/10/2026   1:41 PM           5815 chi_tieu_model_thang_11.xlsx


    Directory:
    C:\Users\Admin\Downloads\MiniPrjoect\starter-kit\quan-ly-model-ai\data


Mode                 LastWriteTime         Length Name
----                 -------------         ------ ----
-a----        11/10/2026   1:41 PM           5815 chi_tieu_model_thang_11.xlsx


    Directory:
    C:\Users\Admin\Downloads\MiniPrjoect\starter-kit\quan-ly-model-ai\docs


Mode                 LastWriteTime         Length Name
----                 -------------         ------ ----
-a----        11/10/2026   1:41 PM            204 tai_lieu_ban_giao.txt


    Directory:
    C:\Users\Admin\Downloads\MiniPrjoect\starter-kit\quan-ly-model-ai\logs


Mode                 LastWriteTime         Length Name
----                 -------------         ------ ----
-a----        11/10/2026   1:41 PM           1234 inference.log


    Directory: C:\Users\Admin\Downloads\MiniPrjoect\starter-kit\quan-ly-model-ai\web


Mode                 LastWriteTime         Length Name
----                 -------------         ------ ----
d-----        11/10/2026   1:41 PM                images
-a----        11/10/2026   1:41 PM            644 app.js
-a----        11/10/2026   1:41 PM            567 index.html
-a----        11/10/2026   1:41 PM            460 style.css


    Directory:
    C:\Users\Admin\Downloads\MiniPrjoect\starter-kit\quan-ly-model-ai\web\images


Mode                 LastWriteTime         Length Name
----                 -------------         ------ ----
-a----        11/10/2026   1:41 PM            339 logo-ai-hub.png

```

### 2 dòng đầu tiên trong logs/loi_model.txt

```text
2026-11-10 08:27:45 ERROR POST /v1/chat/completions model=CLAUDE-35
2026-11-10 08:31:12 ERROR POST /v1/audio/transcriptions model=WHISPER-V3

```

## 4.3. Lọc log vận hành Model AI

### a) Lệnh lọc các dòng ERROR

```shell
  Get-Content .\logs\inference.log | Select-String "ERROR" > .\logs\loi_model.txt
 Get-Content .\logs\loi_model.txt -TotalCount 3
```

### b) Lệnh đếm số dòng WARNING và kết quả

```shell
(Get-Content .\logs\inference.log | Select-String "WARNING").Count

```

```text
5

```

## 4.4. Chạy script tong_hop (.ps1 hoặc .sh)

### Lệnh chạy (Windows: nếu dùng Phụ lục 2 thì ghi cả 2 lệnh)

```shell
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
.\tong_hop.ps1
```

### Nội dung file logs/tong_hop.txt

```text
=== BAO CAO VAN HANH MODEL AI ===

2026-11-10 08:09:18 WARNING POST /v1/embeddings model=LLAMA-2-OLD
2026-11-10 08:16:05 WARNING GET /v1/fine-tune/jobs-legacy
2026-11-10 08:38:29 WARNING GET /images/model-card-v1.png
2026-11-10 09:01:44 WARNING POST /v1/completions model=DAVINCI-002
2026-11-10 09:14:02 WARNING GET /v1/quota/expired-key


6


```

## 4.5. README.md và bảo vệ thông tin bí mật

> README.md, .gitignore và .env.example được chấm trực tiếp trên file ở gốc dự án. Đánh dấu `[x]` vào các mục đã làm để tự kiểm tra.

- [ ] README.md: Heading 1, hình ảnh (`![Alt](path)`), mô tả có **in đậm**, _in nghiêng_ và `inline code`, bảng, code block, task list, blockquote
- [ ] .gitignore có dòng `.env` (tên file đúng, không có đuôi .txt)
- [ ] .env.example có đủ tên biến, giá trị để trống (tên file đúng, không có đuôi .txt)

## 4.6. Kiểm tra trang web bằng DevTools (F12) và báo cáo lỗi

### Bảng lỗi

| STT | Tab DevTools phát hiện lỗi | Tên file hoặc thông báo lỗi | Cách khắc phục |
| --- | -------------------------- | --------------------------- | -------------- |
| 1   |    network                        |  Lỗi không hiển thị logo                           |Sửa lại tên file logo                |
| 2   |    console                        |          Uncaught ReferenceError: hienThiBangModel is not defined                   |     Dổi tên hienThiBangModel cho đúng           |

> Ảnh chụp màn hình lưu trong thư mục `evidence/` (network.png, console.png).

### Báo cáo lỗi gửi trưởng nhóm

- **Context:**Tôi là sinh viên năm nhất chưa fix lỗi hiển thị dữ liệu của web bao giờ
- **Expected:**Bây giờ trang web xem phim của tôi muốn có đủ dữ liệu ở bảng hiển thị giao diện 
- **Actual:** Dữ liệu trên trang web không có gì và tôi vào tab console thấy thông báo lỗi :Uncaught ReferenceError: hienThiBangModel is not defined
- **Log:**Uncaught ReferenceError: hienThiBangModel is not defined

### Câu tìm kiếm Google

```text
site:stackoverflow.com "Uncaught ReferenceError"

```

## 4.7. Excel

> Phần Excel được chấm trực tiếp trên file `data/chi_phi_model_thang_11.xlsx`, không cần ghi vào đây.
