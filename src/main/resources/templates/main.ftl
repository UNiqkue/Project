<#include "parts/security.ftl">

<#import "parts/common.ftl" as c>

<@c.page>
<div class="form-row">
    <div class="form-group col-md-6">
        <form method="get" action="/main" class="form-inline">
            <input type="text" name="filter" class="form-control" value="${filter?ifExists}" placeholder="Поиск по тегу">
            <button type="submit" class="btn btn-primary ml-2">Поиск</button>
        </form>
    </div>
</div>

    <#if isAdmin || user?? && !isReader>
<a class="btn btn-primary" data-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false" aria-controls="collapseExample">
    Новая запись
</a>
<div class="collapse" id="collapseExample">
    <div class="form-group mt-3">
        <form method="post" enctype="multipart/form-data">
            <div class="form-group">
                <input type="text" class="form-control" name="title" placeholder="Название"/>
            </div>
            <div class="form-group">
                <textarea type="text" class="form-control" rows="20" name="text" placeholder="Введите сообщение" ></textarea>
            </div>
            <div class="form-group">
                <input type="text" class="form-control" name="category" placeholder="Раздел">
            </div>
            <div class="form-group">
                <input type="text" class="form-control" name="tag" placeholder="Тэг">
            </div>
            <div class="form-group">
                <div class="custom-file">
                    <input type="file" name="file" id="customFile">
                    <label class="custom-file-label" for="customFile">Выбрать файл</label>
                </div>
            </div>
            <input type="hidden" name="_csrf" value="${_csrf.token}" />
            <div class="form-group">
                <button type="submit" class="btn btn-primary">Добавить</button>
            </div>
        </form>
    </div>
</div>
</#if>



<div class="card-columns">
    <#list messages as message>
    <div class="card my-3">
        <#if message.filename??>
        <img src="/img/${message.filename}" class="card-img-top">
        </#if>
            <h1>${message.title}</h1>
            <h3>Раздел: ${message.category}</h3>
            <span>${message.text}</span>
            <i><br />${message.tag}</i>
        <div class="card-footer text-muted">
            ${message.authorName}
        </div>
        </div>

    </div>
    <#else>
    По вашему запросу сообщений не найдено
    </#list>
</div>
</@c.page>
