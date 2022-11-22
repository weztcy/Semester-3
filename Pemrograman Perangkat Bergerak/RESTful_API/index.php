<?php
    $file_db = "db_mahasiswa";

    try{
        $pdo = new PDO("sqlite:$file_db");
        $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        $pdo->setAttribute(PDO::ATTR_EMULATE_PREPARES, false);

        $sql_create = "CREATE TABLE IF NOT EXISTS `data_personal`(
            `id` integer primary key AUTOINCREMENT,
            `nama` text NOT NULL,
            `NIM` varchar(14) NOT NULL,
            `tanggal_lahir` date NOT NULL)";
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
        $NIM = $_POST['NIM'];
        $tanggal_lahir = $_POST['tanggal_lahir'];
        $query = "insert into data_personal (nama, NIM, tanggal_lahir) values (?, ?, ?)";
        $stmt = $pdo->prepare($query);
        $res = $stmt->execute($nama, $NIM, $tanggal_lahir);
        if($res){
            $data = ['nama'=>$nama, 'NIM'=>$tanggal_lahir, 'tanggal_lahir'=>$tanggal_lahir];
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