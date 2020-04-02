<?php

defined('BASEPATH') OR exit('No direct script allowed');

require APPPATH . '/libraries/REST_Controller.php';
use Restserver\Libraries\REST_Controller;

class Tagihan extends REST_Controller {

	public function __construct($config = 'rest')
	{
		parent::__construct();
		$this->load->database();
		$this->load->model("Tagihan_model");
		$this->load->helper('rupiah');
	}

	function tagihan_tahunan_get(){
		$nisn = $this->get('nisn');

		$data = $this->Tagihan_model->get_tagihan_tahunan($nisn);

        $this->response(array("result"=>$data, 200));
	}

	function tagihan_get(){
		$nisn = $this->get('nisn');

		$data = $this->Tagihan_model->get_tagihan($nisn);
		$response["error"] = FALSE;
		$response["dibayar"] = rupiah($data["dibayar"]);
		$response["tagihan"] = rupiah($data["tagihan"]);
		echo json_encode($response);
	}

	function tagihan_bulanan_get(){
		$id_tagihan = $this->get('id_tagihan');

		$data = $this->Tagihan_model->get_tagihan_bulanan($id_tagihan);

		$this->response(array("result"=>$data, 200));
	}

}