<?php

/**
 * DAO de gestion des utilisateur.
 */
class AuthDao implements \Temma\Base\Loadable {
	/** Objet de connexion à la base en données. */
	private $_db = null;

	/**
	 * Constructeur.
	 * @param	\Temma\Base\Loader	$loader	Composant d'injection de dépendances.
	 */
	public function __construct(\Temma\Base\Loader $loader) {
		$this->_db = $loader->dataSources['db'];
	}
	/**
	 * Retourne la liste des posts.
	 * @param	int	$page		Numéro de la page.
	 * @param	int	$pageSize	(optionnel) Nombre de posts par page. 10 par défaut.
	 * @return	array	Liste de tableaux associatifs.
	 */
	public function getUser($user_id) {
		$sql = "SELECT	use_i_id AS id,
				use_d_creation AS dateCreation,
				use_s_name AS name,
				use_s_password AS pwd,
				use_s_email AS mail
			FROM User;"
		$users = $this->_db->queryAll($sql);
		return ($users);
	}