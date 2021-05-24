<?php

class Homepage extends \Temma\Web\Controller {

	public function __invoke() {
		$this->_redirect('/post/liste');
	}
}
