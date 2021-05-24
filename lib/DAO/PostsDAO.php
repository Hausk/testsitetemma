<?php

class PostsDao implements \Temma\Base\Loadable {
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
	 * @param	int	$page Numéro de la page.
	 * @param	int	$pageSize Nombre de posts par page.
	 * @return	array liste de tableaux.
	 */
	public function getList(int $page, int $pageSize=10) {
		$sql = "SELECT * FROM Posts
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
			FROM Posts";
		$n = $this->_db->queryOne($sql);
		return ($n['nbr']);
	}
	/**
	 * Création d'un nouveau post.
	 * @param	string $name Nom de l'auteur du post.
	 * @param	string $title Titre.
	 * @param	string $content Contenu.
	 * @return	int	ID identifiant.
	 */
	public function create(string $name, string $title, string $content) : int {
		$sql = "INSERT INTO Posts
			SET posts_d_creation = NOW(),
			    posts_s_name = " . $this->_db->quote($name) . ",
			    posts_s_title = " . $this->_db->quote($title) . ",
			    posts_s_content = " . $this->_db->quote($content);
		$this->_db->exec($sql);
		return ($this->_db->lastInsertId());
	}
}
