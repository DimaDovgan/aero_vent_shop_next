import React from 'react';
import { NEWS_FEED } from '@/app/data/news';

export default function NewsPage() {
  return (
    <div className="min-h-screen bg-black pt-24 pb-12">
      <div className="absolute inset-0 bg-tactical-grid opacity-20 pointer-events-none fixed"></div>

      <div className="max-w-5xl mx-auto px-4 sm:px-6 lg:px-8 relative z-10">
        <div className="mb-10">
          <h1 className="text-4xl md:text-5xl font-stencil text-white mb-3">
            НОВИНИ
          </h1>
          <p className="text-gray-400">
            Офіційні матеріали з mod.gov.ua. Посилання відкриваються у новій вкладці.
          </p>
        </div>

        <div className="space-y-10">
          {NEWS_FEED.map((group) => (
            <section key={group.date} className="bg-gray-tactical/30 border border-white/10 tactical-clip p-6">
              <div className="flex items-center justify-between mb-5">
                <div>
                  <time
                    dateTime={group.date}
                    className="text-sm text-gray-400 uppercase tracking-wider"
                  >
                    {group.label}
                  </time>
                </div>
                <span className="text-xs text-gray-500">
                  {group.items.length} новини
                </span>
              </div>

              <ul className="space-y-4">
                {group.items.map((item) => (
                  <li
                    key={`${group.date}-${item.time}-${item.title}`}
                    className="border-t border-white/10 pt-4 first:border-t-0 first:pt-0"
                  >
                    <article className="flex flex-col md:flex-row gap-3 md:gap-6">
                      <time className="text-sm text-gray-400 md:w-20 shrink-0">
                        {item.time}
                      </time>
                      <a
                        href={item.url}
                        target="_blank"
                        rel="noreferrer"
                        className="text-white hover:text-aero-accent transition-colors leading-snug"
                      >
                        {item.title}
                      </a>
                    </article>
                  </li>
                ))}
              </ul>
            </section>
          ))}
        </div>
      </div>
    </div>
  );
}
