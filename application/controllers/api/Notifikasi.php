<?php

defined('BASEPATH') OR exit('No direct script allowed');

require APPPATH . '/libraries/REST_Controller.php';
use Restserver\Libraries\REST_Controller;

class Notifikasi extends REST_Controller {

    public function __construct($config = 'rest')
	{
		parent::__construct();
		$this->load->database();
		$this->load->model('User_model');
	}

	public function index_post(){
        $id = $this->post('id');
        $email = $this->post('email');
        $token = $this->post('token');

        $this->User_model->token_existed($token);
   
        $token = $this->User_model->simpanToken($id, $email, $token);
            
	
	}

	public function index_get(){
		$id = $this->get('id_pengguna');

		$this->db->where('id_pengguna', $id);
		$this->db->order_by('id', 'DESC');
		$notifikasi = $this->db->get('notifikasi')->result();
		
		$this->response(array("result"=>$notifikasi,200));	
	}

	public function clicked_post(){
		$id = $this->post('id');

		$data = array('isClicked' => "1");
        $this->db->where('id', $id);
        $this->db->update('notifikasi', $data);

	}

	public function notif_get(){
		$id = $this->get('id_pengguna');

		$this->db->where('id_pengguna', $id);
		$this->db->where('isClicked' ,'0');
		$notifikasi = $this->db->get('notifikasi')->result();
		
		$this->response(array("result"=>$notifikasi,200));	
	}

	public function index_delete(){
		$id = $this->delete('id_pengguna');
		$this->db->where('id_pengguna', $id);
		$this->db->delete('notifikasi');

	}


}