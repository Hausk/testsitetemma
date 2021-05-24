<?php

/**
 * DAO de gestion des posts.
 */
class PostDao implements \Temma\Base\Loadable {
	/** Objet de connexion à la base ed données. */
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
	public function getList(int $page, int $pageSize=10) {
		$sql = "SELECT	pos_i_id AS id,
				pos_d_creation AS dateCreation,
				pos_s_author AS author,
				pos_s_title AS title,
				pos_s_content AS content
			FROM Post
			LIMIT " . ((($page - 1) * $pageSize) + 1). ', ' . $pageSize;
		$posts = $this->_db->queryAll($sql);
		return ($posts);
	}
	/**
	 * Retourne le nombre total de posts.
	 * @return	int	Le nombre de posts.
	 */
	public function getCount() : int {
		$sql = "SELECT COUNT(*) AS nbr
			FROM Post";
		$n = $this->_db->queryOne($sql);
		return ($n['nbr']);
	}
	/**
	 * Création d'un nouveau post.
	 * @param	string	$author		Nom de l'auteur du post.
	 * @param	string	$title		Titre du post.
	 * @param	string	$content	Contenu du post.
	 * @return	int	IDentifiant du nouveau post.
	 */
	public function create(string $author, string $title, string $content) : int {
		$sql = "INSERT INTO Post
			SET	pos_d_creation = NOW(),
			    pos_s_author = " . $this->_db->quote($author) . ",
			    pos_s_title = " . $this->_db->quote($title) . ",
			    pos_s_content = " . $this->_db->quote($content);
		$this->_db->exec($sql);
		return ($this->_db->lastInsertId());
	}

	/**
	 * Suppression d'un post.
	 * @param int $id identité du post.
	 */
	public function delete(int $id) {
		$sql = "DELETE FROM Post WHERE pos_i_id = " . $this->_db->quote($id) . ";";
		$this->_db->exec($sql);
	}
}
