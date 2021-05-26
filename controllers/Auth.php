<?php

/**
 * Contrôleur de gestion des utilisateurs.
 */
class Auth extends \Temma\Web\Controller {

	public function login() {
		$this['error'] = $this->_session['error'];
		unset($this->_session['error']);
	}

	public function check() {
		$username = trim($_POST['name'] ?? null);
		$password = trim($_POST['password'] ?? null);

		$userId = null;

		if(!$userId) {
			$this->_session['error'] = true;
			$this->_redirect('/auth/login');
		} else {
			$this->_session['userId'] = $userId;
			$this->_redirect('/post/liste');
		}
	}

}