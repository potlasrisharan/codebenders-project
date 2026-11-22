import { useState, useEffect } from 'react';
import { Link, useNavigate } from 'react-router-dom';
import {
  Search,
  Filter,
  CheckCircle2,
  Sparkles,
  ArrowRight,
  Bookmark,
  BookmarkCheck,
  Shield,
  ExternalLink,
  GraduationCap,
  SlidersHorizontal,
  Building2,
  FileText,
} from 'lucide-react';
import { useCitizenProfile } from '../core/profile/ProfileContext';
import { defaultDiscoveryService } from '../core/discovery/discovery-service';
import { defaultSchemeRepository } from '../core/data/repository';
import { defaultClaimTrackerService } from '../core/tracker/claim-tracker';
import { NATIONAL_STATE_COVERAGE } from '../core/data/coverage-registry';
import { StatusChip } from '../components/ui/StatusChip';
import { Card } from '../components/ui/Card';
import { Button } from '../components/ui/Button';
import { useLanguage, T } from '../core/i18n/LanguageContext';

export function MatchesPage() {
  const navigate = useNavigate();
  const { profile, hasCompletedIntake, activePersonaName } = useCitizenProfile();
  const { t } = useLanguage();

  const [selectedState, setSelectedState] = useState<string>(profile.domicileState || 'All India');
  const [selectedCategory, setSelectedCategory] = useState<string>('');
  const [searchKeyword, setSearchKeyword] = useState<string>('');
  const [includeUnlikely, setIncludeUnlikely] = useState<boolean>(true);
  const [, setCatalogVersion] = useState<number>(0);
  const [savedSchemeIds, setSavedSchemeIds] = useState<string[]>(() =>
    defaultClaimTrackerService.getClaims().map((c) => c.schemeId)
  );

  useEffect(() => {
    fetch('/api/v1/schemes?limit=300')
      .then((res) => (res.ok ? res.json() : null))
      .then((data) => {
        if (data) {
          const list = Array.isArray(data.data) ? data.data : Array.isArray(data.schemes) ? data.schemes : [];
          if (list.length > 0) {
            defaultSchemeRepository.addSchemes(list);
            setCatalogVersion((v) => v + 1);
          }
        }
      })
      .catch(() => {});
  }, []);

  const discoveryResult = defaultDiscoveryService.discover(
    { ...profile, domicileState: selectedState },
    {
      state: selectedState,
      category: selectedCategory || undefined,
      keyword: searchKeyword || undefined,
      includeUnlikely,
    }
  );

  const handleToggleSave = (schemeId: string) => {
    const item = discoveryResult.items.find((i) => i.scheme.id === schemeId);
    if (!item) return;

    if (savedSchemeIds.includes(schemeId)) {
      defaultClaimTrackerService.removeClaim(schemeId);
      setSavedSchemeIds((prev) => prev.filter((id) => id !== schemeId));
    } else {
      defaultClaimTrackerService.saveScheme(item.scheme);
      setSavedSchemeIds((prev) => [...prev, schemeId]);
    }
  };

  const likelyCount = discoveryResult.items.filter((i) => i.eligibility.overallLabel === 'Likely eligible').length;
  const needConfirmCount = discoveryResult.items.filter((i) => i.eligibility.overallLabel === 'Need to confirm').length;

  return (
    <div className="stack matches-page max-w-4xl mx-auto py-6 px-3 sm:px-4 space-y-6">
      {/* Editorial Header */}
      <div className="flex flex-col sm:flex-row sm:items-center justify-between border-b border-zinc-200 pb-4 gap-3">
        <div>
          <div className="flex items-center gap-2 mb-1.5">
            <span className="inline-flex items-center gap-1 px-2.5 py-0.5 rounded-full text-[11px] font-bold tracking-wider uppercase bg-zinc-100 text-zinc-700">
              <GraduationCap className="w-3.5 h-3.5 text-zinc-700" />
              {hasCompletedIntake ? <T id="matches.badge" /> : 'Public Welfare Catalog'}
            </span>
            <span className="text-[11px] font-medium text-zinc-500">
              {hasCompletedIntake ? <T id="matches.logic" /> : '219 Public Schemes'}
            </span>
          </div>
          <h1 className="text-3xl font-extrabold text-zinc-900 tracking-tight flex items-center gap-2.5">
            <Search className="w-7 h-7 text-zinc-900" aria-hidden="true" />
            <T id="matches.title" />
          </h1>
          <div className="text-sm text-zinc-600 mt-1 max-w-xl">
            {hasCompletedIntake
              ? activePersonaName
                ? `Evaluating schemes for demo persona: ${activePersonaName}.`
                : <T id="matches.lead" />
              : 'Browse all 219 published central and state welfare schemes across India. Complete intake to discover your personalized eligibility.'}
          </div>
        </div>

        <div className="flex items-center gap-2">
          {hasCompletedIntake ? (
            <Button
              variant="secondary"
              onClick={() => navigate('/intake')}
              className="text-xs px-3.5 py-2 btn-tactile flex items-center gap-1.5 border-zinc-300 hover:border-zinc-400 bg-white"
            >
              <SlidersHorizontal className="w-3.5 h-3.5 text-zinc-600" />
              <T id="matches.btn.edit" />
            </Button>
          ) : (
            <Button
              variant="primary"
              onClick={() => navigate('/intake')}
              className="text-xs px-3.5 py-2 btn-tactile flex items-center gap-1.5 bg-zinc-900 text-white rounded-lg shadow-xs"
            >
              <FileText className="w-3.5 h-3.5" />
              <span>Start Citizen Intake</span>
              <ArrowRight className="w-3.5 h-3.5" />
            </Button>
          )}
        </div>
      </div>

      {/* Prominent Callout Banner when user hasn't completed intake */}
      {!hasCompletedIntake && (
        <Card className="p-4 sm:p-5 bg-gradient-to-r from-indigo-50/90 via-white to-emerald-50/60 border border-indigo-200/90 rounded-2xl shadow-xs flex flex-col sm:flex-row sm:items-center justify-between gap-4 animate-scale-in">
          <div className="space-y-1">
            <div className="flex items-center gap-2">
              <Sparkles className="w-4 h-4 text-indigo-600" />
              <span className="text-xs font-bold text-indigo-950 uppercase tracking-wider">
                Looking for schemes you qualify for?
              </span>
            </div>
            <p className="text-xs text-zinc-600 max-w-xl leading-relaxed">
              You are currently viewing the general public catalog. Take our 1-minute Intake Questionnaire to get deterministic 3-valued eligibility matching based on your role, income, and domicile.
            </p>
          </div>
          <Button
            variant="primary"
            onClick={() => navigate('/intake')}
            className="text-xs font-bold px-4 py-2.5 bg-indigo-950 hover:bg-indigo-900 text-white rounded-xl shadow-xs btn-tactile whitespace-nowrap flex items-center gap-1.5 flex-shrink-0"
          >
            <span>Take Citizen Intake</span>
            <ArrowRight className="w-4 h-4" />
          </Button>
        </Card>
      )}

      {/* Real-time Match Metrics Strip */}
      <div className="grid grid-cols-2 sm:grid-cols-4 gap-2.5">
        <div className="p-3 bg-white border border-zinc-200 rounded-xl shadow-xs">
          <span className="text-[11px] text-zinc-500 font-medium block">
            {hasCompletedIntake ? <T id="matches.stat.total" /> : 'Total Catalog'}
          </span>
          <span className="text-xl font-extrabold text-zinc-900">{discoveryResult.totalSchemesConsidered}</span>
        </div>
        <div className="p-3 bg-emerald-50/70 border border-emerald-200 rounded-xl shadow-xs">
          <span className="text-[11px] text-emerald-700 font-medium block">
            {hasCompletedIntake ? <T id="matches.stat.likely" /> : 'Covered States'}
          </span>
          <span className="text-xl font-extrabold text-emerald-800">
            {hasCompletedIntake ? likelyCount : '32 States/UTs'}
          </span>
        </div>
        <div className="p-3 bg-amber-50/70 border border-amber-200 rounded-xl shadow-xs">
          <span className="text-[11px] text-amber-700 font-medium block">
            {hasCompletedIntake ? <T id="matches.stat.need" /> : 'Welfare Sectors'}
          </span>
          <span className="text-xl font-extrabold text-amber-800">
            {hasCompletedIntake ? needConfirmCount : '7 Sectors'}
          </span>
        </div>
        <div className="p-3 bg-zinc-50 border border-zinc-200 rounded-xl shadow-xs">
          <span className="text-[11px] text-zinc-500 font-medium block"><T id="matches.stat.saved" /></span>
          <span className="text-xl font-extrabold text-zinc-900">{savedSchemeIds.length}</span>
        </div>
      </div>

      {/* Coverage Disclosure Notice (FR-DATA-11) */}
      {discoveryResult.coverageNotice && (
        <div className="p-3 bg-amber-50/90 border border-amber-200 rounded-xl text-xs text-amber-900 flex items-start gap-2.5 animate-slide-down-fade">
          <Shield className="w-4 h-4 text-amber-600 flex-shrink-0 mt-0.5" />
          <div className="leading-relaxed">
            <strong className="font-bold">Jurisdiction Data Disclosure:</strong> {discoveryResult.coverageNotice}
          </div>
        </div>
      )}

      {/* Filter and Search Bar */}
      <Card className="p-4 bg-white border-zinc-200/90 shadow-xs space-y-3">
        <div className="grid grid-cols-1 sm:grid-cols-3 gap-3 text-xs">
          <div>
            <label className="font-bold text-zinc-800 block mb-1">State / Jurisdiction:</label>
            <select
              value={selectedState}
              onChange={(e) => setSelectedState(e.target.value)}
              className="w-full p-2.5 border border-zinc-300 rounded-lg bg-zinc-50/70 focus:bg-white focus:ring-1 focus:ring-zinc-900 focus:outline-none"
            >
              <option value="All India">All India (All 28 States &amp; 8 UTs)</option>
              {NATIONAL_STATE_COVERAGE.filter((st) => !st.stateName.toLowerCase().includes('all india')).map((st) => (
                <option key={st.stateCode} value={st.stateName}>
                  {st.stateName} ({st.coverageStatus === 'covered' ? 'Verified Catalog' : 'Partial / Pending'})
                </option>
              ))}
            </select>
          </div>

          <div>
            <label className="font-bold text-zinc-800 block mb-1">Category Filter:</label>
            <select
              value={selectedCategory}
              onChange={(e) => setSelectedCategory(e.target.value)}
              className="w-full p-2.5 border border-zinc-300 rounded-lg bg-zinc-50/70 focus:bg-white focus:ring-1 focus:ring-zinc-900 focus:outline-none"
            >
              <option value="">{t('matches.filter.all_cats')}</option>
              <option value="scholarship">Scholarships &amp; Fee Reimbursement</option>
              <option value="fellowship">Fellowships &amp; Higher Studies</option>
              <option value="welfare">Welfare &amp; Financial Support</option>
            </select>
          </div>

          <div>
            <label className="font-bold text-zinc-800 block mb-1">Search Keywords:</label>
            <div className="relative">
              <input
                type="text"
                value={searchKeyword}
                onChange={(e) => setSearchKeyword(e.target.value)}
                placeholder={t('matches.filter.search_ph')}
                className="w-full p-2.5 border border-zinc-300 rounded-lg pl-8 bg-zinc-50/70 focus:bg-white focus:ring-1 focus:ring-zinc-900 focus:outline-none"
              />
              <Search className="w-4 h-4 text-zinc-400 absolute left-2.5 top-3" />
            </div>
          </div>
        </div>

        <div className="pt-2.5 border-t border-zinc-100 flex items-center justify-between text-xs text-zinc-600">
          <label className="flex items-center gap-2 cursor-pointer select-none">
            <input
              type="checkbox"
              checked={includeUnlikely}
              onChange={(e) => setIncludeUnlikely(e.target.checked)}
              className="rounded text-zinc-900 focus:ring-zinc-900 w-4 h-4"
            />
            <T id="matches.filter.include_unlikely" className="text-zinc-700" />
          </label>

          <span className="text-zinc-500 font-mono text-[11px]">
            {discoveryResult.items.length} matching candidate schemes
          </span>
        </div>
      </Card>

      {/* Discovered Schemes List */}
      <div className="space-y-4">
        {discoveryResult.items.length === 0 ? (
          <div className="p-10 text-center bg-white rounded-xl border border-zinc-200 text-zinc-500 text-sm space-y-2">
            <Filter className="w-10 h-10 text-zinc-400 mx-auto mb-2" />
            <p className="font-bold text-zinc-800 text-base">No schemes found matching this filter.</p>
            <p className="text-xs text-zinc-500 max-w-sm mx-auto">
              Try changing the state, clearing the search query, or selecting &quot;All Categories&quot;.
            </p>
          </div>
        ) : (
          discoveryResult.items.map(({ scheme, eligibility, nearMatch }) => {
            const isSaved = savedSchemeIds.includes(scheme.id);
            const satisfiedCount = eligibility.predicateTraces.filter((t) => t.result === 'true').length;
            const totalCount = eligibility.predicateTraces.length;

            const isLikely = eligibility.overallLabel === 'Likely eligible';
            const isNeedConfirm = eligibility.overallLabel === 'Need to confirm';

            return (
              <Card
                key={scheme.id}
                className={`p-5 bg-white rounded-2xl border transition-all duration-200 card-interactive ${
                  isLikely
                    ? 'border-emerald-200 ring-1 ring-emerald-500/10'
                    : isNeedConfirm
                    ? 'border-amber-200 ring-1 ring-amber-500/10'
                    : 'border-zinc-200'
                }`}
              >
                <div className="flex flex-col gap-3.5">
                  {/* Top Bar: Jurisdiction Pill, Department & Status Chip */}
                  <div className="flex flex-col sm:flex-row sm:items-start justify-between gap-2.5">
                    <div className="space-y-1">
                      <div className="flex flex-wrap items-center gap-2">
                        <span className="text-[10px] font-bold uppercase tracking-wider px-2 py-0.5 rounded-full bg-zinc-100 text-zinc-700">
                          {scheme.jurisdiction === 'central' ? 'Central (All India)' : `${scheme.state} State`}
                        </span>
                        <span className="text-[11px] text-zinc-500 flex items-center gap-1">
                          <Building2 className="w-3 h-3 text-zinc-400" />
                          {scheme.sources?.[0]?.department || scheme.department || 'Govt Department'}
                        </span>
                        <span className="text-zinc-300">•</span>
                        <span className="text-[11px] text-zinc-400 font-mono">
                          Verified {scheme.lastVerifiedDate} (v{scheme.version})
                        </span>
                      </div>

                      <h2 className="text-lg font-bold text-zinc-900 leading-snug">
                        <Link
                          to={`/scheme/${scheme.id}`}
                          className="hover:text-zinc-600 transition-colors inline-flex items-center gap-1.5"
                        >
                          {scheme.name}
                        </Link>
                      </h2>
                    </div>

                    <div className="flex-shrink-0">
                      {hasCompletedIntake ? (
                        <StatusChip status={eligibility.overallLabel} />
                      ) : (
                        <span className="inline-flex items-center gap-1 px-2.5 py-0.5 rounded-full text-[11px] font-semibold bg-zinc-100 text-zinc-700 border border-zinc-200">
                          Public Scheme
                        </span>
                      )}
                    </div>
                  </div>

                  <p className="text-xs text-zinc-600 leading-relaxed line-clamp-2">
                    {scheme.shortDescription}
                  </p>

                  {/* Near Match Insight Banner if 1-condition miss */}
                  {hasCompletedIntake && nearMatch.isNearMatch && (
                    <div className="p-3 rounded-xl bg-amber-50/80 border border-amber-200 text-xs text-amber-950 flex items-start gap-2.5 animate-scale-in">
                      <Sparkles className="w-4 h-4 text-amber-600 flex-shrink-0 mt-0.5" />
                      <div className="leading-relaxed">
                        <strong className="font-bold text-amber-900">Near-Match Discovery:</strong> {nearMatch.advice}
                      </div>
                    </div>
                  )}

                  {/* Rule Evaluation Summary Card */}
                  {hasCompletedIntake ? (
                    <div className="p-3 bg-zinc-50/80 rounded-xl border border-zinc-100 text-xs space-y-1.5">
                      <p className="text-zinc-800 font-medium leading-relaxed">
                        {eligibility.summaryExplanation}
                      </p>
                      <div className="flex flex-wrap items-center gap-2 text-[11px] text-zinc-500 pt-1 border-t border-zinc-100/80">
                        <span className="inline-flex items-center gap-1 font-semibold text-zinc-800">
                          <CheckCircle2 className="w-3 h-3 text-emerald-600" />
                          Rules satisfied: {satisfiedCount} of {totalCount}
                        </span>
                        {eligibility.missingAttributes.length > 0 && (
                          <span className="text-amber-800 font-medium">
                            • Pending info: {eligibility.missingAttributes.join(', ')}
                          </span>
                        )}
                        {eligibility.failedAttributes.length > 0 && (
                          <span className="text-rose-700 font-medium">
                            • Unmet criteria: {eligibility.failedAttributes.join(', ')}
                          </span>
                        )}
                      </div>
                    </div>
                  ) : (
                    <div className="p-2.5 bg-zinc-50/80 rounded-xl border border-zinc-100 text-xs flex flex-wrap items-center justify-between gap-2">
                      <span className="text-zinc-600 text-[11px]">
                        Target Criteria: <strong>{scheme.rules?.length || 0} published rules</strong> (income, domicile, role)
                      </span>
                      <Link
                        to="/intake"
                        className="text-[11px] font-bold text-indigo-700 hover:text-indigo-950 inline-flex items-center gap-1"
                      >
                        Check My Eligibility <ArrowRight className="w-3 h-3" />
                      </Link>
                    </div>
                  )}

                  {/* Footer Action Bar */}
                  <div className="flex flex-col sm:flex-row sm:items-center justify-between pt-3 border-t border-zinc-100 gap-3">
                    <div className="flex items-center gap-3 text-xs">
                      <span className="font-semibold text-emerald-700 flex items-center gap-1.5">
                        <CheckCircle2 className="w-4 h-4 text-emerald-600" />
                        {scheme.feeStatus === 'free_verified'
                          ? 'Official Application is 100% Free'
                          : scheme.feeDetails}
                      </span>
                      <a
                        href={scheme.sources?.[0]?.portalUrl || scheme.portalUrl || 'https://www.india.gov.in'}
                        target="_blank"
                        rel="noopener noreferrer"
                        className="text-zinc-500 hover:text-zinc-900 inline-flex items-center gap-1 transition-colors text-[11px]"
                      >
                        Official Portal <ExternalLink className="w-3 h-3" />
                      </a>
                    </div>

                    <div className="flex items-center gap-2">
                      <button
                        type="button"
                        onClick={() => handleToggleSave(scheme.id)}
                        className={`text-xs px-3.5 py-1.5 rounded-lg border flex items-center gap-1.5 font-medium transition-all btn-tactile ${
                          isSaved
                            ? 'bg-emerald-50 text-emerald-800 border-emerald-300 font-bold'
                            : 'bg-white text-zinc-700 border-zinc-300 hover:bg-zinc-50'
                        }`}
                      >
                        {isSaved ? (
                          <BookmarkCheck className="w-3.5 h-3.5 text-emerald-600" />
                        ) : (
                          <Bookmark className="w-3.5 h-3.5 text-zinc-500" />
                        )}
                        <T id={isSaved ? 'matches.card.saved' : 'matches.card.save'} />
                      </button>

                      <Link
                        to={`/scheme/${scheme.id}`}
                        className="text-xs px-3.5 py-1.5 rounded-lg bg-zinc-900 hover:bg-zinc-800 text-white !text-white font-semibold inline-flex items-center gap-1.5 transition-colors shadow-xs btn-tactile"
                      >
                        <T id="matches.card.view" inline primaryClassName="!text-white" secondaryClassName="text-zinc-300" />
                        <ArrowRight className="w-3.5 h-3.5 text-white" />
                      </Link>
                    </div>
                  </div>
                </div>
              </Card>
            );
          })
        )}
      </div>
    </div>
  );
}
