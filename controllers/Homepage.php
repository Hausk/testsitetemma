<?php

/**
 * Contrôleur de homepage.
 */
class Homepage extends \Temma\Web\Controller {
	/** Action racine. */
	public function __invoke() {
		$this->_redirect('/post/liste/1');
	}
}
