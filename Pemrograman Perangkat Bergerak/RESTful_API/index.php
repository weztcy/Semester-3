<?php
    $file_db = "db_mahasiswa.db";

    try{
        $pdo = new PDO("sqlite:$file_db");
        $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        $pdo->setAttribute(PDO::ATTR_EMULATE_PREPARES, false);

        $sql_create = "CREATE TABLE IF NOT EXISTS `data_personal`(
            `id` integer primary key AUTOINCREMENT,
            `nama` text NOT NULL,
            `jenis_kelamin` text NOT NULL,
            `tanggal_lahir` date NOT NULL,
            `alamat` text NOT NULL,
            `email` text NOT NULL,
            `no_telepon` integer(12) NOT NULL)";
        $pdo->exec($sql_create);
    }
    catch(PDOException $e){
        throw new PDOException($e->getMessage(), (int)$e->getCode());
    }

    header('Content-Type: application/json');
    
    if($_SERVER['REQUEST_METHOD'] === 'GET'){
        // akses data dari server
        $query = 'select * from data_personal order by id';
        $stmt = $pdo->prepare($query);
        $stmt->execute();
        $data = $stmt->fetchAll(PDO::FETCH_ASSOC);
        echo json_encode($data);
    }
    elseif($_SERVER['REQUEST_METHOD' === 'GET']){
        // tambah data dari server
        $nama = $_POST['nama'];
        $jenis_kelamin = $_POST['jenis_kelamin'];
        $tanggal_lahir = $_POST['tanggal_lahir'];
        $alamat = $_POST['alamat'];
        $email = $_POST['email'];
        $no_telepon = $_POST['no_telepon'];
        $query = "insert into data_personal (nama, jenis_kelamin, tanggal_lahir, alamat, email, no_telepon) values (?, ?, ?, ?, ?, ?)";
        $stmt = $pdo->prepare($query);
        $res = $stmt->execute($nama, $jenis_kelamin, $tanggal_lahir, $alamat, $email, $no_telepon);
        if($res){
            $data = ['nama'=>$nama, 'jenis_kelamin'=>$jenis_kelamin, 'tanggal_lahir'=>$tanggal_lahir, 'alamat'=>$alamat, 'email'=>$email, 'no_telepon'=>$no_telepon];
            echo json_encode($data);
        }
        else{
            echo json_encode(['error'=>$stmt->errorCode()]);
        }
    }
    elseif($_SERVER['REQUEST_METHOD' === 'DELETE']){
        // hapus data dari server
        $id = $_GET['id'];
        $query = "delete from data_personal where id = ?";
        $stmt = $pdo->prepare($query);
        $res = $stmt->execute([$id]);
        if($res){
            $data = ['id'=>$id];
            echo json_encode($data);
        }
        else{
            echo json_encode(['error'=>$stmt->errorCode()]);
        }

    }
?>