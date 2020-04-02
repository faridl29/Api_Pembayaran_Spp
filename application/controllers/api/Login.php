<?php

defined('BASEPATH') OR exit('No direct script allowed');

require APPPATH . '/libraries/REST_Controller.php';
use Restserver\Libraries\REST_Controller;

class Login extends Rest_Controller {

	public function __construct($config = 'rest')
	{
		parent::__construct();
		$this->load->database();
		$this->load->model('User_model');
	}

	public function index_get(){

		$nisn = $this->get('nisn');

		if($nisn != ''){

			$user = $this->User_model->getUserByNisn($nisn);
			$tahun = $this->User_model->getTahunAktif($nisn);
		 
			if ($user != false) {
				// user ditemukan
				$response["error"] = FALSE;
				$response["nisn"] = $user["nisn"];
				$response["nis"] = $user["nis"];
				$response["nama"] = $user["nama"];
				$response["kelas"] = $user["kelas"]." ".$user["nama_kelas"];
				$response["no_telp"] = $user["no_telp"];
				$response["alamat"] = $user["alamat"];
				$response["tahun_aktif"] = $tahun;
				echo json_encode($response);
			} else {
				// user tidak ditemukan password/email salah
				$response["error"] = TRUE;
				$response["error_msg"] = "NISN tidak terdaftar";
				echo json_encode($response);
			}
		
		}else {
			$response["error"] = TRUE;
			$response["error_msg"] = "Isi semua kolom!";
			echo json_encode($response);
		}
	}

}