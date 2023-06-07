import { UseQueryOptions, UseQueryResult, useQuery, useMutation, useQueryClient, MutationFunction, UseMutationOptions } from '@tanstack/react-query';
import axios, { AxiosError, AxiosResponse, Method } from 'axios'

// type pathWithId = (id: number) => string;
// type pathWithoutId = () => string;
type pathFunction = (id?: number, nome?: string) => string;
interface EndpointParams {
    "path": pathFunction,
    "method": Method,
}

interface Endpoints {
    "getRespostaById": EndpointParams,
    "updateResposta": EndpointParams,
    "deleteResposta": EndpointParams,
    "createResposta": EndpointParams,
    "getRespostaIsCorreta": EndpointParams,
    "getQuestaoById": EndpointParams,
    "updateQuestao": EndpointParams,
    "deleteQuestao": EndpointParams,
    "createQuestao": EndpointParams,
    "getQuestoes": EndpointParams,
    "getRespostasByQuestaoId": EndpointParams,
    "getQuestionarioById": EndpointParams,
    "updateQuestionario": EndpointParams,
    "deleteQuestionario": EndpointParams,
    "createQuestionario": EndpointParams,
    "getQuestionarios": EndpointParams,
    "getQuestoesByQuestionarioId": EndpointParams,
    "getJogadorById": EndpointParams,
    "getJogadorByNome": EndpointParams,
    "updateJogador": EndpointParams,
    "deleteJogador": EndpointParams,
    "createJogador": EndpointParams,
    "getJogadores": EndpointParams,
    "getJogadoresRanking": EndpointParams,
    "getAdministradorById": EndpointParams,
    "updateAdministrador": EndpointParams,
    "deleteAdministrador": EndpointParams,
    "createAdministrador": EndpointParams,
    "getAdministradores": EndpointParams,
    "getUsuarios": EndpointParams,
    "getUsuarioById": EndpointParams,
    "getJogoById": EndpointParams,
    "updateJogo": EndpointParams,
    "deleteJogo": EndpointParams,
    "createJogo": EndpointParams,
    "getJogos": EndpointParams,
    "getJogosRanking": EndpointParams,
}

const endpoints: Endpoints = {

    "getRespostaById": {
        "path": (id?: number) => `/api/respostas/${id}`,
        "method": "GET",
    },
    "updateResposta": {
        "path": (id?: number) => `/api/respostas/${id}`,
        "method": "PUT"
    },
    "deleteResposta": {
        "path": (id?: number) => `/api/respostas/${id}`,
        "method": "DELETE",
    },
    "createResposta": {
        "path": () => `/api/respostas`,
        "method": "POST",
    },
    "getRespostaIsCorreta": {
        "path": (id?: number) => `/api/respostas/${id}/isCorreta`,
        "method": "GET",
    },
    "getQuestaoById": {
        "path": (id?: number) => `/api/questoes/${id}`,
        "method": "GET",
    },
    "updateQuestao": {
        "path": (id?: number) => `/api/questoes/${id}`,
        "method": "PUT"
    },
    "deleteQuestao": {
        "path": (id?: number) => `/api/questoes/${id}`,
        "method": "DELETE",
    },
    "createQuestao": {
        "path": () => `/api/questoes`,
        "method": "POST",
    },
    "getQuestoes": {
        "path": () => `/api/questoes`,
        "method": "GET",
    },
    "getRespostasByQuestaoId": {
        "path": (id?: number) => `/api/questoes/${id}/respostas`,
        "method": "GET",
    },
    "getQuestionarioById": {
        "path": (id?: number) => `/api/questionarios/${id}`,
        "method": "GET",
    },
    "updateQuestionario": {
        "path": (id?: number) => `/api/questionarios/${id}`,
        "method": "PUT"
    },
    "deleteQuestionario": {
        "path": (id?: number) => `/api/questionarios/${id}`,
        "method": "DELETE",
    },
    "createQuestionario": {
        "path": () => `/api/questionarios`,
        "method": "POST",
    },
    "getQuestionarios": {
        "path": () => `/api/questionarios`,
        "method": "GET",
    },
    "getQuestoesByQuestionarioId": {
        "path": (id?: number) => `/api/questionarios/${id}/questoes`,
        "method": "GET",
    },
    "getJogadorById": {
        "path": (id?: number) => `/api/players/${id}`,
        "method": "GET",
    },
    "getJogadorByNome": {
        "path": (_, nome?: string) => `/api/players/name/${nome}`,
        "method": "GET",
    },
    "updateJogador": {
        "path": (id?: number) => `/api/players/${id}`,
        "method": "PUT"
    },
    "deleteJogador": {
        "path": (id?: number) => `/api/players/${id}`,
        "method": "DELETE",
    },
    "createJogador": {
        "path": () => `/api/players`,
        "method": "POST",
    },
    "getJogadores": {
        "path": () => `/api/players`,
        "method": "GET",
    },
    "getJogadoresRanking": {
        "path": () => `/api/players/ranking`,
        "method": "GET",
    },
    "getAdministradorById": {
        "path": (id?: number) => `/api/administrators/${id}`,
        "method": "GET",
    },
    "updateAdministrador": {
        "path": (id?: number) => `/api/administrators/${id}`,
        "method": "PUT"
    },
    "deleteAdministrador": {
        "path": (id?: number) => `/api/administrators/${id}`,
        "method": "DELETE",
    },
    "createAdministrador": {
        "path": () => `/api/administrators`,
        "method": "POST",
    },
    "getAdministradores": {
        "path": () => `/api/administrators`,
        "method": "GET",
    },
    "getUsuarios": {
        "path": () => `/api/users`,
        "method": "GET",
    },
    "getUsuarioById": {
        "path": (id?: number) => `/api/users/${id}`,
        "method": "GET",
    },
    "getJogoById": {
        "path": (id?: number) => `/api/jogos/${id}`,
        "method": "GET",
    },
    "updateJogo": {
        "path": (id?: number) => `/api/jogos/${id}`,
        "method": "PUT"
    },
    "deleteJogo": {
        "path": (id?: number) => `/api/jogos/${id}`,
        "method": "DELETE",
    },
    "createJogo": {
        "path": () => `/api/jogos`,
        "method": "POST",
    },
    "getJogos": {
        "path": () => `/api/jogos`,
        "method": "GET",
    },
    "getJogosRanking": {
        "path": () => `/api/jogos/ranking`,
        "method": "GET",
    },
}

interface useQuizQueryProps<T> {
    endpoint: EndpointParams;
    id?: number;
    name?: string;
    body?: any;
    useQueryOptions?: UseQueryOptions<T, AxiosError<ErrorDetails>>;
}
function useQuizQuery<T>({ endpoint, id, name, body, useQueryOptions }: useQuizQueryProps<T>): UseQueryResult<T, AxiosError<ErrorDetails>> {
    return useQuery<T, AxiosError<ErrorDetails>>({
        queryKey: [endpoint.path(id, name)],
        queryFn: () => axios({
            url: endpoint.path(id, name) as string,
            method: endpoint.method,
            data: body,
            ...useQueryOptions
        }).then((res) => res.data).catch((err) => {
            throw err;
        }),
    });
}

interface useQuizMutationProps<T, V = undefined> {
    endpoint: EndpointParams;
    id?: number;
    body?: any;
    options?: UseMutationOptions<AxiosResponse<T>, AxiosError<ErrorDetails>, V>;
}
function useQuizMutation<T, V = undefined>({ endpoint, id, body, options }: useQuizMutationProps<T, V>) {
    return useMutation<AxiosResponse<T>, AxiosError<ErrorDetails>, V>(
        (variables?: V) =>
            axios({
                url: endpoint.path(id),
                method: endpoint.method,
                data: variables,
            }),
        options
    );
}

export { endpoints, useQuizQuery, useQuizMutation, endpoints as default }