<?php

defined('BASEPATH') OR exit('No direct script allowed');

require APPPATH . '/libraries/REST_Controller.php';
use Restserver\Libraries\REST_Controller;


class Profile extends Rest_Controller {

	public function __construct($config = 'rest')
	{
		parent::__construct();
		$this->load->database();
	}

	public function index_put(){
        $id = $this->put('id_pengguna');
		$data = array(
			'nama' 		=>$this->put('nama'),
			'email' 	=>$this->put('email'),
			'divisi' 	=>$this->put('divisi'),
			'telepon' 	=>$this->put('telepon')
		);

		$this->db->where('unique_id',$id);
		$update = $this->db->update('tbl_user', $data);
		
		if($update){
			$response["error"] = FALSE;
			$response["message"] = "Berhasil mengupdate data";
			echo json_encode($response);
		}else{
			$response["error"] = TRUE;
			$response["message"] = "gagal mengupdate date";
			echo json_encode($response);
		}
	}
		
	public function index_post(){
		
		$unique_id = $this->post('id_pengguna');
		$name = $this->post('nama_file');
		$id = str_replace('"', '', $unique_id);
		$nama =  str_replace('"', '', $name);

		// delete gambar yang sudah ada di server
		$this->db->select('*');
		$this->db->from('tbl_user');
		$this->db->where('unique_id', $id);
		$query = $this->db->get();
		foreach($query->result_array() as $row){
			$foto = $row['foto'];
		}
		unlink("../WebAdmin_Rumeet/foto_profile/".$foto);

		$target_dir = "../WebAdmin_Rumeet/foto_profile/"; //folder name where your files will be stored. create this folder inside "file_upload_api" folder
		$target_file = $target_dir . basename($_FILES["file"]["name"]);

		$data = array(
			'foto' 		=> $nama
		);

		
		$response["error"] = TRUE;
		$response["message"] = "gagal mengupdate data";


		if (move_uploaded_file($_FILES["file"]["tmp_name"], $target_file)){
			$this->db->where('unique_id',$id);
			$update = $this->db->update('tbl_user', $data);

			$response["error"] = FALSE;
			$response["message"] = $data;
			$response["user"]["foto"] = $nama;
			
		}



		echo json_encode($response);
		
		
				
	}

}