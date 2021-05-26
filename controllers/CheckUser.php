<?php


class CheckUser extends \Temma\Web\Plugin {
	public function preplugin() {
		if($this['CONTROLLER'] == 'auth') {
			return;
		}
		$userId = $this->_session['userId'];
		if(!$userId) {
			return $this->_redirect('/auth/login');
		}
	}
}