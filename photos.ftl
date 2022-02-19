<#include "module/macro.ftl">
<@layout title="相册 | ${options.blog_title!}">
  <main class="mx-auto" id="container">
    <header class="bg-cover post-cover table relative w-full opacity-95">
        <#if settings.photos_patternimg?? && settings.photos_patternimg!=''>
          <div class="cover-bg bottom-0 left-0 right-0 top-0 opacity-30 absolute">
            <img src="${settings.photos_patternimg!}" class="z-auto"
                 alt="${settings.photos_title!'相册'}">
          </div>
        <#else>
          <div class="placeholder-bg">
          </div>
        </#if>
      <div class="cover-content table-cell relative w-full index flex justify-center">
        <!-- 封面内容 -->
        <div class="inner flex flex-col justify-center pt-40 pb-40">
          <p class="cover-title text-white mb-5 mt-4 leading-loose relative w-full text-left text-4xl">${settings.photos_title!'Photos'}</p>
        </div>
      </div>
    </header>
    <div
      class="mx-auto px-10 mt-16 tracking-wider md:leading-relaxed sm:leading-normal cn-pd photos-page fade-up">
      <div class="photos-box article-content" id="gallery-content">
        <nav id="gallery-filter">
          <ul>
            <li>
              <a href="javascript:void(0);" data-filter="*" class="active">全部</a>
            </li>
              <@photoTag method="listTeams">
                  <#list teams as item>
                    <li>
                      <a href="javascript:void(0);"
                         data-filter=".${((item.team)?length>0)?string((item.team),'默认')}">${((item.team)?length>0)?string((item.team),'默认')}</a>
                    </li>
                  </#list>
              </@photoTag>
          </ul>
        </nav>
        <div class="gallery masonry-gallery">
            <@photoTag method="list">
                <#list photos?sort_by('name')?reverse as photo>
                  <figure class="gallery-item col-3 ${((photo.team)?length>0)?string((photo.team),'默认')}">
                    <header class="gallery-icon">
                      <a data-fancybox="gallery" href="javascript:void(0);">
                        <img class="lazyload" src="${theme_base!}/source/images/loading.svg" data-src="${photo.url!}"
                             alt="${photo.name!}"/>
                      </a>
                    </header>
                    <figcaption class="gallery-caption">
                      <div class="entry-summary">
                        <h3>${photo.name}</h3>
                          <#if photo.description?? && photo.description != "">
                            <p>${photo.description!}</p>
                          </#if>
                      </div>
                    </figcaption>
                    <p class="name" style="display: none">${photo.name}</p>
                  </figure>
                </#list>
            </@photoTag>
        </div>
      </div>
    </div>
  </main>
</@layout>
