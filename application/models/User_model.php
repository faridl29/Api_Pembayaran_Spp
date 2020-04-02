<?php

defined('BASEPATH') OR exit('No direct script allowed');

class User_model extends CI_Model {

	public function __construct()
	{
		parent::__construct();
		$this->load->database();
	}

    public function getUserByNisn($nisn) {
 
        $this->db->where('nisn', $nisn);
        $this->db->join('kelas', 'kelas.id_kelas = siswa.id_kelas');
        $query = $this->db->get('siswa');
 
        if ($query) {
            $user = $query->row_array();
            return $user;

        } else {
            return NULL;
        }
    }

    public function getTahunAktif($nisn){
        $this->db->select_min('tahun_ajaran');
        $this->db->where('nisn', $nisn);
        $query = $this->db->get('tagihan')->row_array();

        $this->db->select_max('tahun_ajaran');
        $this->db->where('nisn', $nisn);
        $query2 = $this->db->get('tagihan')->row_array();

        $data = "Tahun ".substr($query["tahun_ajaran"],0,4)." - ".substr($query2["tahun_ajaran"],5,9);

        return $data;
    }

    public function simpanToken($id, $email, $token){
        $sql = "INSERT INTO token(id,email,token) VALUES(?, ?, ?)";
        $stmt = $this->db->query($sql,array($id, $email, $token));


        // cek jika sudah sukses
        if ($stmt) {
            $sql = "SELECT token FROM token WHERE email = ?";
			$stmt = $this->db->query($sql, array($email));
		
            return $stmt->row_array();
        } else {
            return false;
        }
    }

    public function token_existed($token){
        $this->db->select('*');
        $this->db->from('token');
        $this->db->where('token', $token);
        $query = $this->db->get();
 

        if ($query->num_rows() > 0) {
           
            $this->db->where('token', $token);
            $this->db->delete('token');
            return true;

        } else {
            return false;
        }
    }
}