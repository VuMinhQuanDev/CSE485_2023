<?php
class ArticleService
{
    // Chứa các hàm tương tác và xử lý dữ liệu

    public function getAllArticles()
    {
        try {
            $conn = new PDO('mysql:host=localhost;dbname=project09;port=3306', 'root', '1802');
        } catch (PDOException $e) {
            echo $e->getMessage();
        }
        // Bước 01: Kết nối DB Server
        // Bước 02: Truy vấn DL
        $sql = "SELECT * FROM article";
        $stmt = $conn->query($sql);
        $stmt->execute();
        // Bước 03: Trả về dữ liệu
        $articles = $stmt->fetchAll();
        // Sửa ở đây; Trả về 1 danh sách (Mảng) các ĐỐI TƯỢNG Article;
        return $articles;
    }

    public function addArticles($title, $content)
    {
        try {
            $conn = new PDO('mysql:host=localhost;dbname=project09;port=3306', 'root', '1802');
        } catch (PDOException $e) {
            echo $e->getMessage();
        }
        // Bước 01: Kết nối DB Server
        // Thêm bài viết mới vào bảng
        $sql = "INSERT INTO article (title, content) VALUES (:title, :content)";
        $stmt = $conn->prepare($sql);
        $stmt->bindParam(':title', $title);
        $stmt->bindParam(':content', $content);
        $stmt->execute();
        // Trả về ID của bài viết mới được thêm
        return $conn->lastInsertId();
    }

    public function updateArticles($id, $title, $content)
    {
        try {
            $conn = new PDO('mysql:host=localhost;dbname=project09;port=3306', 'root', '1802');
        } catch (PDOException $e) {
            echo $e->getMessage();
        }
        // Bước 01: Kết nối DB Server
        // Cập nhật thông tin của bài viết
        $sql = "UPDATE article SET title = :title, content = :content WHERE id = :id";
        $stmt = $conn->prepare($sql);
        $stmt->bindParam(':id', $id);
        $stmt->bindParam(':title', $title);
        $stmt->bindParam(':content', $content);
        $stmt->execute();
        // Trả về số hàng bị ảnh hưởng
        return $stmt->rowCount();
    }

    public function deleteArticles($id)
    {
        try {
            $conn = new PDO('mysql:host=localhost;dbname=project09;port=3306', 'root', '1802');
        } catch (PDOException $e) {
            echo $e->getMessage();
        }
        // Bước 01: Kết nối DB Server
        // Xóa bài viết khỏi bảng
        $sql = "DELETE FROM article WHERE id = :id";
        $stmt = $conn->prepare($sql);
        $stmt->bindParam(':id', $id);
        $stmt->execute();
        // Trả về số hàng bị ảnh hưởng
        return $stmt->rowCount();
    }
}

?>