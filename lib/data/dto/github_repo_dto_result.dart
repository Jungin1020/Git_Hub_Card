class GithubRepoDtoResult {
  GithubRepoDtoResult({
    this.id,
    this.nodeId,
    this.name,
    this.fullName,
    this.private,
    this.owner,
    this.htmlUrl,
    this.description,
    this.fork,
    this.createdAt,
    this.updatedAt,
    this.pushedAt,
    this.gitUrl,
    this.sshUrl,
    this.cloneUrl,
    this.svnUrl,
    this.homepage,
    this.size,
    this.stargazersCount,
    this.watchersCount,
    this.language,
    this.hasIssues,
    this.hasProjects,
    this.hasDownloads,
    this.hasWiki,
    this.hasPages,
    this.hasDiscussions,
    this.forksCount,
    this.mirrorUrl,
    this.archived,
    this.disabled,
    this.openIssuesCount,
    this.license,
    this.allowForking,
    this.isTemplate,
    this.webCommitSignoffRequired,
    this.visibility,
    this.forks,
    this.openIssues,
    this.watchers,
    this.defaultBranch,
  });

  GithubRepoDtoResult.fromJson(dynamic json) {
    id = json['id'];
    nodeId = json['node_id'];
    name = json['name'];
    fullName = json['full_name'];
    private = json['private'];
    owner = json['owner'] != null ? Owner.fromJson(json['owner']) : null;
    htmlUrl = json['html_url'];
    description = json['description'];
    fork = json['fork'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    pushedAt = json['pushed_at'];
    gitUrl = json['git_url'];
    sshUrl = json['ssh_url'];
    cloneUrl = json['clone_url'];
    svnUrl = json['svn_url'];
    homepage = json['homepage'];
    size = json['size'];
    stargazersCount = json['stargazers_count'];
    watchersCount = json['watchers_count'];
    language = json['language'];
    hasIssues = json['has_issues'];
    hasProjects = json['has_projects'];
    hasDownloads = json['has_downloads'];
    hasWiki = json['has_wiki'];
    hasPages = json['has_pages'];
    hasDiscussions = json['has_discussions'];
    forksCount = json['forks_count'];
    mirrorUrl = json['mirror_url'];
    archived = json['archived'];
    disabled = json['disabled'];
    openIssuesCount = json['open_issues_count'];
    license = json['license'];
    allowForking = json['allow_forking'];
    isTemplate = json['is_template'];
    webCommitSignoffRequired = json['web_commit_signoff_required'];
    visibility = json['visibility'];
    forks = json['forks'];
    openIssues = json['open_issues'];
    watchers = json['watchers'];
    defaultBranch = json['default_branch'];
  }
  num? id;
  String? nodeId;
  String? name;
  String? fullName;
  bool? private;
  Owner? owner;
  String? htmlUrl;
  dynamic description;
  bool? fork;
  String? createdAt;
  String? updatedAt;
  String? pushedAt;
  String? gitUrl;
  String? sshUrl;
  String? cloneUrl;
  String? svnUrl;
  dynamic homepage;
  num? size;
  num? stargazersCount;
  num? watchersCount;
  String? language;
  bool? hasIssues;
  bool? hasProjects;
  bool? hasDownloads;
  bool? hasWiki;
  bool? hasPages;
  bool? hasDiscussions;
  num? forksCount;
  dynamic mirrorUrl;
  bool? archived;
  bool? disabled;
  num? openIssuesCount;
  dynamic license;
  bool? allowForking;
  bool? isTemplate;
  bool? webCommitSignoffRequired;
  String? visibility;
  num? forks;
  num? openIssues;
  num? watchers;
  String? defaultBranch;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['node_id'] = nodeId;
    map['name'] = name;
    map['full_name'] = fullName;
    map['private'] = private;
    if (owner != null) {
      map['owner'] = owner?.toJson();
    }
    map['html_url'] = htmlUrl;
    map['description'] = description;
    map['fork'] = fork;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    map['pushed_at'] = pushedAt;
    map['git_url'] = gitUrl;
    map['ssh_url'] = sshUrl;
    map['clone_url'] = cloneUrl;
    map['svn_url'] = svnUrl;
    map['homepage'] = homepage;
    map['size'] = size;
    map['stargazers_count'] = stargazersCount;
    map['watchers_count'] = watchersCount;
    map['language'] = language;
    map['has_issues'] = hasIssues;
    map['has_projects'] = hasProjects;
    map['has_downloads'] = hasDownloads;
    map['has_wiki'] = hasWiki;
    map['has_pages'] = hasPages;
    map['has_discussions'] = hasDiscussions;
    map['forks_count'] = forksCount;
    map['mirror_url'] = mirrorUrl;
    map['archived'] = archived;
    map['disabled'] = disabled;
    map['open_issues_count'] = openIssuesCount;
    map['license'] = license;
    map['allow_forking'] = allowForking;
    map['is_template'] = isTemplate;
    map['web_commit_signoff_required'] = webCommitSignoffRequired;
    map['visibility'] = visibility;
    map['forks'] = forks;
    map['open_issues'] = openIssues;
    map['watchers'] = watchers;
    map['default_branch'] = defaultBranch;
    return map;
  }
}

class Owner {
  Owner({
    this.login,
    this.id,
    this.nodeId,
    this.avatarUrl,
    this.gravatarId,
    this.url,
    this.htmlUrl,
    this.type,
    this.siteAdmin,
  });

  Owner.fromJson(dynamic json) {
    login = json['login'];
    id = json['id'];
    nodeId = json['node_id'];
    avatarUrl = json['avatar_url'];
    gravatarId = json['gravatar_id'];
    url = json['url'];
    htmlUrl = json['html_url'];
    type = json['type'];
    siteAdmin = json['site_admin'];
  }
  String? login;
  num? id;
  String? nodeId;
  String? avatarUrl;
  String? gravatarId;
  String? url;
  String? htmlUrl;
  String? type;
  bool? siteAdmin;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['login'] = login;
    map['id'] = id;
    map['node_id'] = nodeId;
    map['avatar_url'] = avatarUrl;
    map['gravatar_id'] = gravatarId;
    map['url'] = url;
    map['html_url'] = htmlUrl;
    map['type'] = type;
    map['site_admin'] = siteAdmin;
    return map;
  }
}
